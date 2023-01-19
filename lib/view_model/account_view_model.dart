import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Repository/account_repository.dart';
import 'package:flutter_application_1/model/accountmodel.dart';
import 'package:image_picker/image_picker.dart';

class AccountViewModel with ChangeNotifier {
  final _myAccountRepo = AccountRepository();
  bool showLoader = false;

  void setAccountLoading(bool value) {
    showLoader = value;
    notifyListeners();
  }

  Future<AccountModel>? fetchAccount(String number) async {
    try {
      log(number);
      // setAccountLoading(true);
      return await _myAccountRepo.accountservice(phone: number);

      // notifyListeners();
    } catch (e) {
      setAccountLoading(false);
      // notifyListeners();
      rethrow;
    }
  }
}
