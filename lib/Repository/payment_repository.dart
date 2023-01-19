import 'dart:developer';

import 'package:flutter_application_1/data/Network/NetworkApiServices.dart';
import 'package:flutter_application_1/model/transactionmodal.dart';
import 'package:flutter_application_1/res/app_urls.dart';

import '../data/Network/BaseApiServices.dart';

class PaymentRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> payment(TransactionModal data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrls.paymentpost, data.toServerMap());
      log(response.toString());

      return response;
    } catch (e) {
      throw e;
    }
  }
}
