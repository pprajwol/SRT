import 'package:srtapp/screens/organizations/organization.dart';
import 'package:srtapp/screens/personalized_contact/personalized_contact.dart';

List<Map<String, dynamic>> contactDetails = [
  {
    "label": "Emergency Helpline",
    "value": "000",
    "onClick": "call",
  },
  {
    "label": "Police",
    "value": "100",
    "onClick": "call",
  },
  {
    "label": "Organizations",
    "value": OrganizationScreen.routeName,
    "onClick": "page",
  },
  {
    "label": "Personalized Contact",
    "value": PersonalizedContactScreen.routeName,
    "onClick": "page",
  },
];
