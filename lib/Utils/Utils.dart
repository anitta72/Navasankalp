import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 20);
  }

  static snackbar(String message, BuildContext context) async {
    return ScaffoldMessenger.of(context).showSnackBar(
      await SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }
}
