import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:srtapp/models/personalized_contact.dart';
import 'package:srtapp/screens/organizations/add_organization.dart';
import 'package:srtapp/screens/personalized_contact/add_personalized_contact.dart';
import 'package:srtapp/utils/boxes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/organization.dart';

class PersonalizedContactScreen extends StatefulWidget {
  static const String routeName = '/personalized_contact';
  const PersonalizedContactScreen({Key? key}) : super(key: key);

  @override
  State<PersonalizedContactScreen> createState() =>
      _PersonalizedContactScreenState();
}

class _PersonalizedContactScreenState extends State<PersonalizedContactScreen> {
  @override
  void dispose() {
    // Hive.box('organizations').close();
    super.dispose();
  }

  List<PersonalizedContact> personalizedContact = [];

  Widget buildContent(List<PersonalizedContact> personalizedContact) {
    return ListView.builder(
      itemCount: personalizedContact.length,
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
                Uri.parse('tel:${personalizedContact[index].number}'),
              );
            },
            title: Text(personalizedContact[index].name),
            subtitle: Text(personalizedContact[index].number),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AddPersonalizedContact.routeName,
                        arguments: personalizedContact[index],
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
                            title: const Text('Delete Contact?'),
                            content: Text(
                                'Are you sure you want to delete ${personalizedContact[index].name}?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  personalizedContact[index].delete();
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
        title: const Text('Personalized Contact'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddPersonalizedContact.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ValueListenableBuilder<Box<PersonalizedContact>>(
          valueListenable: Boxes.getPersonalizedContacts().listenable(),
          builder: (context, box, child) {
            personalizedContact =
                box.values.toList().cast<PersonalizedContact>();
            return buildContent(personalizedContact);
          }),
    );
  }
}
