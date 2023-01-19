import 'dart:convert';
import 'dart:developer';
import 'package:flutter_application_1/res/app_urls.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Repository/auth_repository.dart';
import 'package:flutter_application_1/Screens/HomeScreen/homescreen.dart';
import 'package:flutter_application_1/Screens/Login/login_screen.dart';
import 'package:flutter_application_1/model/authmodel.dart';

class AuthViewModel with ChangeNotifier {
  bool loading = false;

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future UpdateUserData(SignInModel model) async {
    try {
      String uri = AppUrls.userprofilepost;
      var map = new Map<String, dynamic>();
      map['username'] = '${model.phoneNumber}';
      map['name'] = '${model.name}';
      map['address'] = '${model.address}';
      map['mandalam'] = '${model.mandalam}';
      map['booth'] = 'null';
      map['block'] = '${model.block}';
      final response = await http.post(Uri.parse(uri), body: map);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        log(response.body);
        var res = json.decode(response.body);
        return res["Signed in Successfully"];
      } else {
        throw Exception('cant load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
