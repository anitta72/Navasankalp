import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Notification/notification_details.dart';
import 'package:flutter_application_1/Widgets/Navbar/navbarscreen.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              return Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu_sharp,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          "Contact Us",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue[100],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MessageView()),
                );
              },
              icon: const Icon(
                Icons.notification_add_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.png"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Image.asset("images/Rectangle 72.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: Colors.orange, shape: BoxShape.circle),
                      child: Image.asset("images/Group 79.png"),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "International Media & Information\nTechnology Park",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: "Poppins"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "LF Tower, Tana-irinjalakuda",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Thrissur, Kerala Pin : 680125",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              debugPrint("clicked");
                              var url = Uri.parse("tel:8949627624");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.phone,
                                  size: 20,
                                  color: Colors.orange,
                                ),
                                Text(
                                  "+918949627624",
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              final url = Uri.parse("mailto:info@imitpark.com");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.email,
                                  color: Colors.orange,
                                  size: 20,
                                ),
                                Text(
                                  "info@imitpark.com",
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              debugPrint("clicked");
                              var url = Uri.parse("tel:0480 2991234");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.phone,
                                  color: Colors.orange,
                                  size: 20,
                                ),
                                Text(
                                  "0480 2991234",
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          GestureDetector(
                            onTap: () async {
                              final url =
                                  Uri.parse("mailto:contact@imitpark.com");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.email,
                                  color: Colors.orange,
                                  size: 20,
                                ),
                                Text(
                                  "contact@imitpark.com",
                                  style: TextStyle(
                                      fontSize: 13, fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Colors.orange, shape: BoxShape.circle),
                        child: Image.asset("images/Group 80.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "International Media &  Information\nTechnolagy Park",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: "Poppins"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Iswcs Building, Kattor, Irinjalakuda",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Thrissur, Kerala pin:680125",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
