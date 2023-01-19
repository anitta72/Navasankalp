import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Navbar/navbarscreen.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class Slogan extends StatelessWidget {
  const Slogan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: NavBar(),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  return Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu_sharp,
                  color: Colors.black,
                ));
          },
        ),
        elevation: 0,
        backgroundColor: Colors.blue[100],
        title: const Text(
          "Slogan",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const MessageView()),
              // );
            },
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.black,
          ),
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
            child: Column(children: [
              SloganWidget(
                slogan:
                    "‘Mile Kadam, Jude Vatan’: Congress releases slogan for Bharat Jodo Yatra",
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class SloganWidget extends StatelessWidget {
  SloganWidget({super.key, required this.slogan});

  copytext() {
    final value = ClipboardData(text: slogan);
    Clipboard.setData(value);
  }

  String slogan;
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('dd-MM-yyy').format(date).toString(),
                  style: const TextStyle(color: Colors.blue),
                ),
                PopupMenuButton<String>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text("Copy"),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Text Copied")));
                        copytext();
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("Share"),
                      onTap: () {
                        Share.share(slogan);
                      },
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              slogan,
              style: const TextStyle(
                  fontFamily: "poppins",
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
