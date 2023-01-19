import 'dart:developer';

import 'package:flutter_application_1/data/Network/BaseApiServices.dart';
import 'package:flutter_application_1/data/Network/NetworkApiServices.dart';
import 'package:flutter_application_1/model/blocklistmodel.dart';
import 'package:flutter_application_1/res/app_urls.dart';
import 'package:http/http.dart ' as http;

class BlocKRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future fetchBlocks() async {
    try {
      List<BlockModel> result = List.empty(growable: true);

      var response =
          await _apiServices.getGetApiResponse(AppUrls.blockListGetUrl);

      for (var blocks in response) {
        // log(blocks.toString());
        result.add(BlockModel.fromJson(blocks));
      }
      return result;
    } catch (e) {
      throw e;
    }
  }
}
