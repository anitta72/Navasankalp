import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Notification/notification_details.dart';
import 'package:flutter_application_1/Widgets/Navbar/navbarscreen.dart';
import 'package:url_launcher/url_launcher.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const NavBar(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MessageView()),
                );
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ))
        ],
        title: Center(
          child: Text(
            "Disclaimer",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset("images/navlogo.png")),
        ),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 15,
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No warranties:",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color.fromARGB(255, 211, 145, 46)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url = Uri.parse('http://dccthrissur.com/');
                      if (await launchUrl(url)) {
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      "http://dccthrissur.com/ ",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                      '(hereinafter referred to as the “website”) is provided “as is” without any representations or warranties, express or implied. This website makes no representations or warranties in relation to this website or the information and materials provided on this website.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Without prejudice to the generality of the foregoing paragraph, the website does not warrant that:",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      color: Colors.white,
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "•",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "this website will be constantly available, or available at all; or",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "•",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "the information on this website is complete, true, accurate or non-misleading.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Nothing on this website constitutes, or is meant to constitute, advice of any kind.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Limitations of liability",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color.fromARGB(255, 211, 145, 46)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'The website will not be liable to you (whether under the law of contact, the law of torts or otherwise) in relation to the contents of, or use of, or otherwise in connection with, this website'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "•",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text('for any direct loss'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "•",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text('for any indirect, special or consequential loss'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "•",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                          'for any business losses, loss of revenue, \nincome, profits or anticipated savings, loss of \ncontracts or business relationships, loss of \nreputation or goodwill, or loss or corruption \nof information or data.'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'All maps on thrssurdcc.org are provided by Google Maps and are for illustration purpose only.These limitations of liability apply even if the website has been expressly advised of the potential loss.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Exceptions",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color.fromARGB(255, 211, 145, 46)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      ' Nothing in this website disclaimer will exclude or limit any warranty implied by law that it would be unlawful to exclude or limit; and nothing in this website disclaimer will exclude or limit this website’s liability in respect of any:'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "•",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                          'fraud or fraudulent misrepresentation on the \npart of the website'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "•",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                          'matter which it would be illegal or \nunlawful for the website to exclude or limit, \nor to attempt or purport to exclude \nor limit, its liability.'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Reasonableness',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color.fromARGB(255, 211, 145, 46)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "By using this website, you agree that the exclusions and limitations of liability set out in this website disclaimer are reasonable. If you do not think they are reasonable, you must not use this website."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Other parties ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color.fromARGB(255, 211, 145, 46)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'You accept that, as a political campaigning entity, the website has an interest in limiting the personal liability of its staff and volunteers. You agree that you will not bring any claim personally against the website’s staff or volunteers in respect of any losses you suffer in connection with the website.You agree that the limitations of warranties and liability set out in this website disclaimer will protect the website’s staff, volunteers, agents, contractors, as well as the website itself.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Unenforceable provisions',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color.fromARGB(255, 211, 145, 46)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'If any provision of this website disclaimer is, or is found to be, unenforceable under applicable law, that will not affect the enforceability of the other provisions of this website disclaimer.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'This website disclaimer is based on an original template created by IMIT Park LTD. and distributed by imitpark.com')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
