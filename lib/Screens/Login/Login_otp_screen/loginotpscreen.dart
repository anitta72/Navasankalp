import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/HomeScreen/homescreen.dart';
import 'package:flutter_application_1/Screens/Login/login_screen.dart';
import 'package:flutter_application_1/Screens/SignIn/signinscreen.dart';
import 'package:flutter_application_1/Screens/Login/login_control.dart';
import 'package:flutter_application_1/Screens/Login/login_services.dart';
import 'package:flutter_application_1/Sharedprefs.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginOtp extends StatefulWidget {
  LoginOtp({super.key, this.number});

  String? number;
  int timeleft = 10;
  bool isLoading = true;

  @override
  State<LoginOtp> createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationid = "";
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginOtp()));
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }

  static const maxSeconds = 10;
  int seconds = maxSeconds;
  Timer? timer;
  bool showTimer = true;

  showtimer(bool value) {
    setState(() {
      showTimer = value;
    });
  }

  // void startTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (_) {
  //     if (seconds > 1) {
  //       showtimer(true);
  //       setState(() {
  //         seconds--;
  //       });
  //     } else {
  //       stopTimer();
  //       showtimer(false);
  //     }
  //   });
  // }

  // void stopTimer() {
  //   timer?.cancel();
  // }

  void initState() {
    // TODO: implement initState
    // startTimer();

    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose

  //   starttimer();
  // }

  @override
  Widget build(BuildContext context) {
    final otp = TextEditingController();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.fill)),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset("images/Group 1140 (1).png")),
                    SizedBox(
                      height: 80,
                    ),
                    Text("Log in OTP",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold)),
                    Text("Please enter OTP  to continue",
                        style: TextStyle(fontSize: 11)),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'We sent an SMS with an Activation Code \n     to Your Phone $phone',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PinFieldAutoFill(
                      controller: otp,
                      codeLength: 6,
                      onCodeSubmitted: (value) {
                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(
                        //       builder: (context) =>const HomeScreen(),
                        //     ),
                        //     (route) => false);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // showTimer
                    //     ? Container(
                    //         padding: EdgeInsets.all(8),
                    //         decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(10)),
                    //         child: Text(
                    //           'You will get SMS code with in $seconds seconds',
                    //           style: TextStyle(fontWeight: FontWeight.bold),
                    //         ),
                    //       )
                    //     : Center(
                    //         child: SizedBox(
                    //           height: 40,
                    //           width: 130,
                    //           child: ElevatedButton(
                    //               style: ElevatedButton.styleFrom(
                    //                   elevation: 3,
                    //                   shape: RoundedRectangleBorder(
                    //                       borderRadius:
                    //                           BorderRadius.circular(12.0)),
                    //                   minimumSize: const Size(130, 40)),
                    //               onPressed: () async {
                    //                 final signcode =
                    //                     await SmsAutoFill().getAppSignature;
                    //                 fetchotp();
                    //               },
                    //               child: Text("Resend OTP")),
                    //         ),
                    //       ),
                    // const SizedBox(
                    //   height: 40,
                    // ),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              minimumSize: const Size(130, 40)),
                          onPressed: () {
                            // if (otp.text.isEmpty) {
                            //   return;
                            // }
                            // starttimer();
                            log(widget.number.toString());
                            LoginControll model =
                                LoginControll(phonenumber: widget.number!);
                            log(model.toJson().toString());
                            if (model.phonenumber != null) {
                              LoginServices server = LoginServices();
                              // PaymentControl contl = PaymentControl();
                              String mob = phone!.substring(3, phone!.length);

                              server.login(model.toJson()).then((value) => {
                                    if (value.message!.toLowerCase() ==
                                        "user created".toLowerCase())
                                      {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignIn(phone: widget.number!),
                                            ))
                                      }
                                    else
                                      {
                                        SharedPrefs.setPhone(mob),
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ),
                                        )
                                      }
                                  });
                            }
                          },
                          child: widget.isLoading
                              ? Text('Next')
                              : const SpinKitThreeInOut(
                                  duration: Duration(seconds: 5),
                                  color: Colors.white,
                                )),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Center(
                      child: SizedBox(
                        width: 280,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            debugPrint("clicked");
                            var url = Uri.parse("tel:8593833370");
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          icon: const Icon(
                            Icons.call,
                          ),
                          label: const Text(
                            "Call Customer Care",
                            style: TextStyle(fontSize: 12),
                          ),
                          //.........
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchotp() async {
    debugPrint("printtttt");

    debugPrint(phone.toString());

    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        log(credential.smsCode.toString());
        await auth.signInWithCredential(credential);
        log(credential.accessToken.toString());
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          log(e.message.toString());
        }
      },
      codeSent: (String verificationid, int? resendToken) async {
        this.verificationid = verificationid;
        log(verificationid.characters.toString());
        log(resendToken.toString());
      },
      codeAutoRetrievalTimeout: (String verificationid) {
        log(verificationid.toString());
      },
    );
  }

  void starttimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (widget.timeleft > 0) {
        setState(
          () {
            widget.timeleft--;
          },
        );
      } else {
        timer.cancel();
      }
    });
  }
}
