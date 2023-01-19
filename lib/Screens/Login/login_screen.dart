import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Login/Login_otp_screen/loginotpscreen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

String? phone;

class _LoginState extends State<Login> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/pic.png'), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
                Center(child: Image.asset("images/Group 1140 (1).png")),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 115, 0, 0),
                  child: const Text("Login",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 21,
                          fontWeight: FontWeight.bold)),
                ),
                const Text("Please Login to continue",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 11,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: IntlPhoneField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (value) {
                      phone = value.completeNumber;
                      log(phone.toString());
                    },
                  ),
                ),
                const SizedBox(
                  height: 57,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        minimumSize: const Size(130, 40)),
                    onPressed: () async {
                      if (phone == null) {
                        return;
                      }
                      final signcode = await SmsAutoFill().getAppSignature;
                      log(signcode);

                      if (phone!.isNotEmpty && phone!.length == 13) {
                        String dat = phone!.substring(3);
                        log(dat);
                        fetchotp().then((value) => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginOtp(
                                  number: dat,
                                ),
                              ),
                            ));
                      }
                    },
                    child: const Text("Next"),
                  ),
                ),
                SizedBox(
                  height: 125,
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
    );
  }

  Future<void> fetchotp() async {
    debugPrint("printtttt");

    debugPrint(phone.toString());

    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        log(credential.smsCode.toString());
        await auth.signInWithCredential(credential).then((value) => null);
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
}
