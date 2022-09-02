import 'package:flutter/material.dart';
import 'package:srtapp/data/contact_details.dart';
import 'package:srtapp/screens/continue_to_app/app_homepage.dart';
import 'package:srtapp/screens/homepage/background.dart';
import 'package:srtapp/screens/organizations/organization.dart';
import 'package:srtapp/utils/assets.dart';
import 'package:srtapp/utils/constants.dart';
import 'package:srtapp/utils/size.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  Widget buildChild(BuildContext context) {
    return SafeArea(
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
                          // Text(
                          //   'Welcome to SRT App',
                          //   style: Theme.of(context).textTheme.headline5,
                          // ),
                          Text(
                            'Are you Safe?',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.headline5,
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'Your first priority is to make sure you are safe. If you feel unsafe or require emergency support, click the',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  TextSpan(
                                    text: ' support button',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: ' below.',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // bottom
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).colorScheme.primary,
                              onPrimary:
                                  Theme.of(context).colorScheme.onPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Constants.borderRadius),
                              ),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 700,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Numbers
                                          Text(
                                            "EMERGENCY NUMBERS",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5
                                                ?.copyWith(
                                                  color: Colors.red,
                                                ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.45,
                                            child: ListView.builder(
                                              itemCount: contactDetails.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: const EdgeInsets.all(
                                                      Constants
                                                          .listViewItemMargin),
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.2),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: Constants
                                                            .offset, // changes position of shadow
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Constants
                                                                .borderRadius),
                                                  ),
                                                  child: ListTile(
                                                    title: Text(
                                                      contactDetails[index]
                                                          ['label'],
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      if (contactDetails[index]
                                                              ['onClick'] ==
                                                          'call') {
                                                        launchUrl(
                                                          Uri.parse(
                                                              'tel:${contactDetails[index]['value']}'),
                                                        );
                                                      } else if (contactDetails[
                                                                  index]
                                                              ['onClick'] ==
                                                          'page') {
                                                        Navigator.pushNamed(
                                                          context,
                                                          contactDetails[index]
                                                              ['value'],
                                                        );
                                                      }
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),

                                          TextButton(
                                              onPressed: (() =>
                                                  {Navigator.pop(context)}),
                                              child: const Text(
                                                'Close',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              )),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: const Text('Support'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(AppHomepage.routeName);
                            },
                            child: const Text('Continue to App'),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Background(child: buildChild(context)));
  }
}
