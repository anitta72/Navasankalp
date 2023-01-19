import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/About%20us/about_screen.dart';
import 'package:flutter_application_1/Screens/Contact/contact_screen.dart';
import 'package:flutter_application_1/Screens/Disclaimer/disclaimerscreen.dart';
import 'package:flutter_application_1/Screens/Login/login_screen.dart';
import 'package:flutter_application_1/Screens/Notification/notification_details.dart';

import 'package:flutter_application_1/Screens/PrivacyPolicy/privacy_policy.dart';
import 'package:flutter_application_1/Screens/HomeScreen/homescreen.dart';
import 'package:flutter_application_1/Sharedprefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(""),
            accountEmail: Text(""),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/RajivGandhi-1.jpg"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    horizontalTitleGap: -40,
                    leading: Icon(Icons.home),
                    title: const Center(child: Text("Home")),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    horizontalTitleGap: -40,
                    leading: Icon(Icons.notifications),
                    title: const Center(child: Text("Notification")),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MessageView()),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const MessageView()),
                      // );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    horizontalTitleGap: -40,
                    leading: Icon(Icons.phone),
                    title: const Center(child: Text("Contact Us")),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactUs()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    horizontalTitleGap: -40,
                    leading: Icon(Icons.privacy_tip_outlined),
                    title: const Center(child: Text("Privacy Policy")),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPolicy()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    horizontalTitleGap: -40,
                    leading: Icon(Icons.privacy_tip_outlined),
                    title: const Center(child: Text("Disclaimer")),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Disclaimer()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    horizontalTitleGap: -40,
                    leading: Icon(Icons.account_circle_sharp),
                    title: const Center(child: Text("About Us")),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const aboutus()),
                      );
                    },
                  ),
                ),
                // Card(
                //   child: ListTile(
                //     horizontalTitleGap: -40,
                //     leading: Icon(Icons.star),
                //     title: const Center(child: Text("Rating")),
                //     onTap: () {},
                //   ),
                // ),
                Card(
                  child: ListTile(
                    horizontalTitleGap: -40,
                    leading: Icon(Icons.logout_outlined),
                    title: const Center(child: Text("Log Out")),
                    onTap: () {
                      logOut(context);
                    },
                  ),
                ),
                // Card(
                //   child: ListTile(
                //     title: const Center(child: Text("Seva Dal")),
                //     onTap: () {},
                //   ),
                // ),
                // Card(
                //   child: ListTile(
                //     title: const Center(child: Text("Vijayaveedhi")),
                //     onTap: () {},
                //   ),
                // ),
                // Card(
                //   child: ListTile(
                //     title: const Center(child: Text("Dalit Congress")),
                //     onTap: () {},
                //   ),
                // ),
                // Card(
                //   child: ListTile(
                //     title: const Center(child: Text("AICC")),
                //     onTap: () {},
                //   ),
                // ),
                // Card(
                //   child: ListTile(
                //     title: const Center(child: Text("Pravasi Congress")),
                //     onTap: () {},
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void logOut(BuildContext context) async {
    final login = await SharedPreferences.getInstance();
    await login.remove('name');
    SharedPrefs.clearData();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
        (route) => false);
  }
}
