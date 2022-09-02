import 'package:flutter/material.dart';
import 'package:srtapp/models/personalized_contact.dart';
import 'package:srtapp/screens/continue_to_app/app_homepage.dart';
import 'package:srtapp/screens/continue_to_app/immediate_response_screen.dart';
import 'package:srtapp/screens/continue_to_app/prevent_violences_screen.dart';
import 'package:srtapp/screens/continue_to_app/quick_resources_screen.dart';
import 'package:srtapp/screens/continue_to_app/report_incident_screen.dart';
import 'package:srtapp/screens/continue_to_app/support_services_screen.dart';
import 'package:srtapp/screens/homepage/homepage.dart';
import 'package:srtapp/screens/organizations/add_organization.dart';
import 'package:srtapp/screens/organizations/organization.dart';
import 'package:srtapp/screens/personalized_contact/add_personalized_contact.dart';
import 'package:srtapp/screens/personalized_contact/personalized_contact.dart';
import 'package:srtapp/utils/light_theme.dart';

// hive
import 'package:hive_flutter/hive_flutter.dart';

import 'models/organization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(OrganizationAdapter());
  Hive.registerAdapter(PersonalizedContactAdapter());
  await Hive.openBox<Organization>('organizations');
  await Hive.openBox<PersonalizedContact>('personalized_contacts');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SRT App',
      theme: lightTheme(),
      themeMode: ThemeMode.light,
      home: const AppView(title: 'Home Page'),
      routes: {
        OrganizationScreen.routeName: (context) => const OrganizationScreen(),
        AddOrganization.routeName: (context) => AddOrganization(),
        PersonalizedContactScreen.routeName: (context) =>
            const PersonalizedContactScreen(),
        AddPersonalizedContact.routeName: (context) => AddPersonalizedContact(),
        AppHomepage.routeName: (context) => const AppHomepage(),
        ImmediateResponseScreen.routeName: (context) =>
            const ImmediateResponseScreen(),
        ReportIncidentScreen.routeName: (context) =>
            const ReportIncidentScreen(),
        SupportServicesScreen.routeName: (context) =>
            const SupportServicesScreen(),
        QuickResourcesScreen.routeName: (context) =>
            const QuickResourcesScreen(),
        PreventViolencesScreen.routeName: (context) =>
            const PreventViolencesScreen(),
      },
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}
