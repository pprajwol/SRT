import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:srtapp/screens/organizations/add_organization.dart';
import 'package:srtapp/utils/boxes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/organization.dart';

class OrganizationScreen extends StatefulWidget {
  static const String routeName = '/organization';
  const OrganizationScreen({Key? key}) : super(key: key);

  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  @override
  void dispose() {
    // Hive.box('organizations').close();
    super.dispose();
  }

  List<Organization> organizations = [];

  Widget buildContent(List<Organization> organizations) {
    return ListView.builder(
      itemCount: organizations.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: ListTile(
            onTap: () {
              launchUrl(
                Uri.parse('tel:${organizations[index].number}'),
              );
            },
            title: Text(organizations[index].name),
            subtitle: Text(organizations[index].number),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AddOrganization.routeName,
                        arguments: organizations[index],
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Delete Organization?'),
                            content: Text(
                                'Are you sure you want to delete ${organizations[index].name}?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  organizations[index].delete();
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organization'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddOrganization.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ValueListenableBuilder<Box<Organization>>(
          valueListenable: Boxes.getOrganizations().listenable(),
          builder: (context, box, child) {
            organizations = box.values.toList().cast<Organization>();
            return buildContent(organizations);
          }),
    );
  }
}
