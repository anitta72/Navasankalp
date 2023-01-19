import 'dart:developer';

import 'package:flutter_application_1/data/Network/BaseApiServices.dart';
import 'package:flutter_application_1/data/Network/NetworkApiServices.dart';
import 'package:flutter_application_1/model/mandalamlistmodel.dart';
import 'package:flutter_application_1/res/app_urls.dart';

class MandalamRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future GetMandalamByBlock(int data) async {
    try {
      List<MandalamModel> result = List.empty(growable: true);
      dynamic response = await _apiServices
          .getPostApiResponse(AppUrls.mandalamListPostUrl, {"block": "$data"});
      var res = response["data"];
      for (var map in res) {
        result.add(MandalamModel.fromJson(map));
      }
      return result;
    } catch (e) {
      throw e;
    }
  }
}
