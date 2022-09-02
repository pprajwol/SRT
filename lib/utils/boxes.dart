import 'package:hive/hive.dart';
import 'package:srtapp/models/personalized_contact.dart';
import '../models/organization.dart';

class Boxes {
  static Box<Organization> getOrganizations() =>
      Hive.box<Organization>('organizations');
  static Box<PersonalizedContact> getPersonalizedContacts() =>
      Hive.box<PersonalizedContact>('personalized_contacts');
}
