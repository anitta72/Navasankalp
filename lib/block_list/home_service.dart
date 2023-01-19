import 'dart:convert';
import 'package:flutter_application_1/block_list/bolck_model/usersmodel.dart';
import 'package:flutter_application_1/urls/urls.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<UsersModel> getAll(data) async {
    final uri = Uri.parse(usersUrl);
    var response = await http.get(uri);

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return await responseJson;
      case 400:
        throw Exception(response.body.toString());
      case 404:
        throw Exception(response.body.toString());
      default:
        throw Exception(
          'Error occurred while communicating with server' +
              'with status code' +
              response.statusCode.toString(),
        );
    }
  }
}
