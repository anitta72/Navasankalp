import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_1/model/accountmodel.dart';
import 'package:flutter_application_1/urls/urls.dart';
import 'package:http/http.dart' as http;

class AccountRepository {
  Future<AccountModel> accountservice({required String phone}) async {
    String uri = userprofileget(phone: phone);
    final response = await http.get(Uri.parse(uri));

    switch (response.statusCode) {
      case 200:
        log(response.body);
        var data = json.decode(response.body);
        // log(data);
        return AccountModel.fromJson(data["data"]);
      default:
        return throw response.statusCode;
    }
  }
}
