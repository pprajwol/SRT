import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:srtapp/models/organization.dart';
import 'package:srtapp/models/personalized_contact.dart';
import 'package:srtapp/utils/boxes.dart';

class AddPersonalizedContact extends StatefulWidget {
  static const String routeName = '/add_personalized_contact';
  AddPersonalizedContact({Key? key}) : super(key: key);

  @override
  State<AddPersonalizedContact> createState() => _AddPersonalizedContactState();
}

class _AddPersonalizedContactState extends State<AddPersonalizedContact> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  bool isInit = false;
  late PersonalizedContact personalizedContact;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // check if the page is opened for editing or adding
    if (ModalRoute.of(context)!.settings.arguments != null) {
      personalizedContact =
          ModalRoute.of(context)!.settings.arguments as PersonalizedContact;
      _nameController.text = personalizedContact.name;
      _numberController.text = personalizedContact.number;
      isInit = true;
    }
    super.didChangeDependencies();
  }

  Future addPersonalizedContact(String name, String number) async {
    final personalizedContact = PersonalizedContact()
      ..name = name
      ..number = number;
    final Box<PersonalizedContact> box = Boxes.getPersonalizedContacts();
    box.add(personalizedContact);
  }

  Future updatePersonalizedContact(PersonalizedContact personalizedContact,
      String name, String number) async {
    personalizedContact.name = name;
    personalizedContact.number = number;
    personalizedContact.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Personalized Contact'),
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
                  hintText: "Enter contact name",
                  label: Text("Contact name"),
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
                  hintText: "Enter contact number",
                  label: Text("Contact number"),
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
                                updatePersonalizedContact(
                                    personalizedContact,
                                    _nameController.text,
                                    _numberController.text),
                                Navigator.of(context).pop(),
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Contact updated'),
                                  ),
                                )
                              }
                            else
                              {
                                addPersonalizedContact(_nameController.text,
                                    _numberController.text),
                                Navigator.of(context).pop(),
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Contact added'),
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
