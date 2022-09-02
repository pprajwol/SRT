import 'package:flutter/material.dart';
import 'package:srtapp/screens/continue_to_app/immediate_response_screen.dart';
import 'package:srtapp/screens/continue_to_app/prevent_violences_screen.dart';
import 'package:srtapp/screens/continue_to_app/quick_resources_screen.dart';
import 'package:srtapp/screens/continue_to_app/report_incident_screen.dart';
import 'package:srtapp/screens/continue_to_app/support_services_screen.dart';
import 'package:srtapp/screens/homepage/background.dart';
import 'package:srtapp/utils/assets.dart';
import 'package:srtapp/utils/constants.dart';
import 'package:srtapp/utils/size.dart';

class AppHomepage extends StatelessWidget {
  static const String routeName = '/appHomepage';
  const AppHomepage({Key? key}) : super(key: key);
  Widget buildChild(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.0),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
              ),
              child: const Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // top part
              Container(
                margin: const EdgeInsets.all(Constants.boxMargin),
                height: size(context).height * 0.2,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Constants.offset, // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(Constants.borderRadius),
                ),
                child: Center(
                  child: Image.asset(
                    Assets.logofull,
                    height: size(context).height * 0.1,
                  ),
                ),
              ),
              // bottom part
              Container(
                  margin: const EdgeInsets.all(Constants.boxMargin),
                  height: size(context).height * 0.4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Constants.offset, // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(Constants.borderRadius),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // heading part
                        Column(
                          children: [
                            AppHomepageItem(
                              name: 'Immediate Response 1',
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    ImmediateResponseScreen.routeName);
                              },
                            ),
                            AppHomepageItem(
                              name: 'Report Incident',
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(ReportIncidentScreen.routeName);
                              },
                            ),
                            AppHomepageItem(
                              name: 'Support Services',
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(SupportServicesScreen.routeName);
                              },
                            ),
                            AppHomepageItem(
                              name: 'Quick Resources',
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(QuickResourcesScreen.routeName);
                              },
                            ),
                            AppHomepageItem(
                              name: 'Prevent Violences',
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    PreventViolencesScreen.routeName);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(child: buildChild(context));
  }
}

class AppHomepageItem extends StatelessWidget {
  AppHomepageItem({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  final String name;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.6,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Constants.offset, // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(
            Constants.borderRadius,
          ),
        ),
        child: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
