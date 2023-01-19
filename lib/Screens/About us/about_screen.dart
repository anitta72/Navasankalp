import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Notification/notification_details.dart';
import 'package:flutter_application_1/Widgets/Navbar/navbarscreen.dart';

class aboutus extends StatelessWidget {
  const aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.black),
        ),
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset("images/navlogo.png")),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MessageView()),
                );
              },
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              )),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/background.png'),
                    fit: BoxFit.fill)),
            child: Image.asset('images/about.jpeg')),
      ),
    );
  }
}
