import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Account/accountscreen.dart';
import 'package:flutter_application_1/Screens/History/history_screen.dart';
import 'package:flutter_application_1/Screens/Notification/notification_details.dart';
import 'package:flutter_application_1/Sharedprefs.dart';
import 'package:flutter_application_1/Widgets/Navbar/navbarscreen.dart';
import 'package:flutter_application_1/Screens/Payment/payment.dart';
import 'package:flutter_application_1/Screens/calender/calenderscreen.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL() async {
  final url = Uri.parse('https://v2.imitpark.com/dcc-plus/');
  if (await launchUrl(url)) {
  } else {
    throw 'Could not launch $url';
  }
}

link() async {
  final url = Uri.parse('https://v2.imitpark.com/dcc-plus/');
  if (await launchUrl(url)) {
  } else {
    throw 'Could not launch $url';
  }
}

openURL() async {
  final url = Uri.parse('https://imitpark.com/');
  if (await launchUrl(url)) {
  } else {
    throw 'Could not launch $url';
  }
}

uRL() async {
  final url = Uri.parse('https://ardram.org/');
  if (await launchUrl(url)) {
  } else {
    throw 'Could not launch $url';
  }
}

chURl() async {
  final url = Uri.parse('https://wa.me/c/918593833300');
  if (await launchUrl(url)) {
  } else {
    throw 'Could not launch $url';
  }
}

shiftURL() async {
  final url = Uri.parse('http://dccthrissur.com/');
  if (await launchUrl(url)) {
  } else {
    throw 'Could not launch $url';
  }
}

void youTube() async {
  final url = Uri.parse('https://www.youtube.com/watch?v=Nv2_yXSe784');
  if (await launchUrl(url)) {
  } else {
    throw CupertinoActivityIndicator(
      color: Colors.grey[600],
    );
  }
}

Widget buildImagethumbnail(
  String urlImage,
  int index,
) {
  return GestureDetector(
    onTap: () async {
      if (index == 0) {
        final url = Uri.parse('https://ardram.org/');
        if (await launchUrl(url)) {
        } else {
          throw const CircularProgressIndicator();
        }
      } else if (index == 1) {
        final url = Uri.parse('https://v2.imitpark.com/dcc-plus/');
        if (await launchUrl(url)) {
        } else {
          throw const CircularProgressIndicator();
        }
      } else if (index == 2) {
        final url = Uri.parse('https://ww w.facebook.com/DCCThrissurOfficial/');
        if (await launchUrl(url)) {
        } else {
          throw const CircularProgressIndicator();
        }
      }
    },
    child: Container(
      color: Colors.grey,
      width: double.infinity,
      child: Image.asset(
        urlImage,
        fit: BoxFit.fill,
      ),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> urlImagethumbnail = [
    "images/BharatJodoYatra1-01.jpg",
    "images/IndiraGandhi-01.jpg",
    "images/1000veedu.jpeg",
    "images/Nehru-01.jpg"
  ];

  Widget buildImage(String urlImage, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        color: Colors.grey,
        width: double.infinity,
        height: 250,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  int activeindex = 0;

  List<String> images = [
    "images/JoseVallur-01.jpg",
    "images/Anilkumar-01.jpg",
    "images/Sliders-01.jpg",
    "images/MallikarjunKharge-01.jpg",
    "images/KSudhakaran-01.jpg",
    "images/Rahul Gandhi-01.jpg",
    "images/PriyankaGandhi-01.jpg",
    "images/SoniaGandhi-01.jpg",
    "images/VDSatheeshan-01.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'DCC THRISSUR',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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
                Icons.notification_add_outlined,
                color: Colors.black,
                size: 30,
              )),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: CarouselSlider.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = images[index];
                        return buildImage(urlImage, index);
                      },
                      options: CarouselOptions(
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                        height: 200,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeindex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                  iconSize: 40,
                                  icon: const Icon(
                                    size: 28,
                                    MaterialCommunityIcons.account,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () async {
                                    await SharedPrefs.getPhone();

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Account()),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('അക്കൗണ്ട്')
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const IconButton(
                                  iconSize: 40,
                                  icon: Icon(
                                    size: 28,
                                    MaterialCommunityIcons.book,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: link,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('നേതൃത്വം')
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                  iconSize: 40,
                                  icon: const Icon(
                                    size: 28,
                                    MaterialCommunityIcons.history,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const History()),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ചരിത്രം')
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                  iconSize: 40,
                                  icon: const Icon(
                                    size: 28,
                                    MaterialCommunityIcons.volume_medium,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () async {
                                    final url = Uri.parse(
                                        'https://v2.imitpark.com/dcc-plus/slogan.php');

                                    if (url.hasAbsolutePath) {
                                      await launchUrl(url);
                                    } else {
                                      throw const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('മുദ്രാവാക്യം')
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: .0,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                  iconSize: 40,
                                  icon: const Icon(
                                    size: 28,
                                    MaterialCommunityIcons.shopping,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () async {
                                    final url = Uri.parse(
                                        'http://irinjalakudakhadi.org/#services');

                                    if (url.hasAbsolutePath) {
                                      await launchUrl(url);
                                    } else {
                                      throw const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('സ്റ്റോർ')
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: .0,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                  iconSize: 40,
                                  icon: const Icon(
                                    size: 28,
                                    MaterialCommunityIcons.play,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () async {
                                    final url = Uri.parse(
                                        'https://soundcloud.com/keralapcc');

                                    if (url.hasAbsolutePath) {
                                      await launchUrl(url);
                                    } else {
                                      throw const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ഗാനങ്ങൾ')
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: .0,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                  iconSize: 40,
                                  icon: const Icon(
                                    size: 28,
                                    MaterialCommunityIcons.calendar_alert,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CalendarApp()),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('കലണ്ടർ')
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: .0,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                  iconSize: 40,
                                  icon: const Icon(
                                    size: 28,
                                    MaterialCommunityIcons.school_outline,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () async {
                                    final url = Uri.parse(
                                        'https://v2.imitpark.com/dcc-plus/trainingcenter.php');

                                    if (url.hasAbsolutePath) {
                                      await launchUrl(url);
                                    } else {
                                      throw const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('സ്കൂൾ ')
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: .0,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                  iconSize: 40,
                                  icon: const Icon(
                                    size: 28,
                                    MaterialCommunityIcons.view_gallery,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () async {
                                    final url = Uri.parse(
                                        'https://v2.imitpark.com/dcc-plus/gallery.php');

                                    if (url.hasAbsolutePath) {
                                      await launchUrl(url);
                                    } else {
                                      throw const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ഗാലറി ')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Image.asset(
                                "images/138Challenge-01 (2).jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: SizedBox(
                                width: 100.0,
                                height: 40.0,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            // side: const BorderSide(
                                            //     // thickness
                                            //     color: Colors.white // color
                                            //     ),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => App(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Pay",
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    )),
                              ),
                            )
                            // Positioned(
                            //   bottom: 10,
                            //   right: 10,
                            //   child: SizedBox(
                            //     width: 100.0,
                            //     height: 38.0,
                            //     child: ElevatedButton(
                            //       style: ElevatedButton.styleFrom(
                            //           backgroundColor: Colors.white,
                            //           side: const BorderSide(
                            //               width: 20,
                            //               color: Colors
                            //                   .blueAccent // the color of the border
                            //               )),
                            //       onPressed: () {
                            //         Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (context) => App(),
                            //           ),
                            //         );
                            //       },
                            //       child: const Text(
                            //         "Pay",
                            //         style: TextStyle(color: Colors.blueAccent),
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("DCC Social Media Pages",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 60,
                                width: 100,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                    icon: const Icon(
                                      MaterialCommunityIcons.facebook,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () async {
                                      final url = Uri.parse(
                                          'https://m.facebook.com/profile.php?id=100082346110650');
                                      if (await launchUrl(url)) {
                                      } else {
                                        throw const CircularProgressIndicator();
                                      }
                                    }),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 60,
                                width: 100,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                    icon: const Icon(
                                      MaterialCommunityIcons.instagram,
                                      color: Colors.pink,
                                    ),
                                    onPressed: () async {
                                      final url = Uri.parse(
                                          'https://instagram.com/dcc_thrissur_?igshid=OGQ2MjdiOTE=');
                                      if (await launchUrl(url)) {
                                      } else {
                                        throw const CircularProgressIndicator();
                                      }
                                    }),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 60,
                                width: 100,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: IconButton(
                                  icon: const Icon(
                                    MaterialCommunityIcons.youtube,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    youTube();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  CarouselSlider.builder(
                    itemCount: urlImagethumbnail.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImagethumbnail[index];
                      return buildImagethumbnail(
                        urlImage,
                        index,
                      );
                    },
                    options: CarouselOptions(
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          shiftURL();
                        },
                        child: const Text("DCC Website"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "images/TRUSTEDIT.jpeg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(width: 1, color: Colors.white),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                  20,
                                ))),
                            onPressed: () {
                              launchURL();
                            },
                            child: Text(
                              'ISWCS WEBSITE',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                        // Positioned(
                        //   right: 10,
                        //   bottom: 10,
                        //   child: ElevatedButton(
                        //       style: ButtonStyle(),
                        //       onPressed: () {
                        //         launchURL();
                        //       },
                        //       child: const Text("ISWCS Website")),
                        // )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "images/IMIT (1).png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 15,
                          bottom: 10,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(width: 1, color: Colors.white),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                  20,
                                ))),
                            onPressed: () {
                              openURL();
                            },
                            child: Text(
                              'IMIT WEBSITE',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            "images/Aardram.jpg",
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(width: 1, color: Colors.white),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                  20,
                                ))),
                            onPressed: () {
                              uRL();
                            },
                            child: Text(
                              'ARDRAM WEBSITE',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
