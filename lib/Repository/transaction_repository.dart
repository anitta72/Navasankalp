import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_1/model/transactionmodal.dart';
import 'package:flutter_application_1/res/app_urls.dart';
import 'package:flutter_application_1/urls/urls.dart';
import "package:http/http.dart" as http;

import '../data/Network/BaseApiServices.dart';
import '../data/Network/NetworkApiServices.dart';

class TransactionRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future GetHistoryByPhone(String data) async {
    try {
      List<TransactionModal> result = List.empty(growable: true);
      dynamic response = await _apiServices
          .getPostApiResponse(AppUrls.transactionhistory, {"phone": "$data"});
      log(response.toString());
      var res = response["data"];
      for (var map in res) {
        result.add(TransactionModal.fromJson(map));
      }

      return result;
    } catch (e) {
      throw e;
    }
  }
}
