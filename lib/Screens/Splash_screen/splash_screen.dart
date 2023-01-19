import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/HomeScreen/homescreen.dart';
import 'package:flutter_application_1/Screens/Login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // VideoPlayerController? controllerVideo;

  @override
  void initState() {
    checkLoin(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/splash.png'), fit: BoxFit.fill),
                ),
              ),
              // Container(
              //   height: 50,
              //   width: 150,
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage('images/splash.png'),
              //         fit: BoxFit.fitWidth),
              //   ),
              // ),
              // Positioned(
              //   bottom: 1,
              //   child: Container(
              //     height: 250,
              //     child: FooterWidget(),
              //   ),
              // ),
              // Container(
              //   height: 250,
              //   child: HeaderWidget(250),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkLoin(BuildContext context) async {
    final login = await SharedPreferences.getInstance();
    String? user = login.getString("phone");
    if (user == null || user.isEmpty) {
      gotonextpage(context);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => HomeScreen(),
          ),
          (route) => false);
    }
  }

  Future<void> gotonextpage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => const Login(),
        ),
        (route) => false);
  }
}
