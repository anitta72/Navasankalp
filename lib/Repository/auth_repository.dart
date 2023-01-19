import 'dart:developer';

import 'package:flutter_application_1/data/Network/BaseApiServices.dart';
import 'package:flutter_application_1/data/Network/NetworkApiServices.dart';
import 'package:flutter_application_1/model/authmodel.dart';
import 'package:flutter_application_1/res/app_urls.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> signUpApi(data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.userprofilepost, data);
      log(response.toString());

      return response;
    } catch (e) {
      throw e;
    }
  }
}
