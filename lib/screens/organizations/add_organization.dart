import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:srtapp/models/organization.dart';
import 'package:srtapp/utils/boxes.dart';

class AddOrganization extends StatefulWidget {
  static const String routeName = '/addOrganization';
  AddOrganization({Key? key}) : super(key: key);

  @override
  State<AddOrganization> createState() => _AddOrganizationState();
}

class _AddOrganizationState extends State<AddOrganization> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  bool isInit = false;
  late Organization organization;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // check if the page is opened for editing or adding
    if (ModalRoute.of(context)!.settings.arguments != null) {
      organization = ModalRoute.of(context)!.settings.arguments as Organization;
      _nameController.text = organization.name;
      _numberController.text = organization.number;
      isInit = true;
    }
    super.didChangeDependencies();
  }

  Future addOrganization(String name, String number) async {
    final organization = Organization()
      ..name = name
      ..number = number;
    final Box<Organization> box = Boxes.getOrganizations();
    box.add(organization);
  }

  Future updateOrganization(
      Organization organization, String name, String number) async {
    organization.name = name;
    organization.number = number;
    organization.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Organization'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: "Enter Organization name",
                  label: Text("Organization name"),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter Organization number",
                  label: Text("Organization number"),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: (() => {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate())
                          {
                            if (isInit)
                              {
                                // edit the organization
                                updateOrganization(
                                    organization,
                                    _nameController.text,
                                    _numberController.text),
                                Navigator.of(context).pop(),
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Organization updated'),
                                  ),
                                )
                              }
                            else
                              {
                                addOrganization(_nameController.text,
                                    _numberController.text),
                                Navigator.of(context).pop(),
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Organization added'),
                                  ),
                                )
                              },
                          }
                      }),
                  child: isInit ? const Text('Update') : const Text('Add')),
            ],
          ),
        ),
      ),
    );
  }
}
