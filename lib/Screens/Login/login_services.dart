import 'dart:convert';
import 'dart:developer';
import 'package:flutter_application_1/Screens/Login/login_model.dart';
import 'package:flutter_application_1/urls/urls.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  Future<LoginModel> login(model) async {
    String uri = loginurl;

    final response = await http.post(Uri.parse(uri), body: model);
    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      log(response.body);

      return LoginModel.fromJson(json.decode(response.body));
    } else {
      return LoginModel.statusCode(response.statusCode);
    }
  }
}
