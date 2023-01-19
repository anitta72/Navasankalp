import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Repository/payment_repository.dart';
import 'package:flutter_application_1/model/transactionmodal.dart';
import 'package:flutter_application_1/res/app_urls.dart';
import 'package:http/http.dart' as http;

class PaymentViewModel with ChangeNotifier {
  TransactionModal paymentResponse = TransactionModal();
  final _myrepo = PaymentRepository();

  bool loading = false;

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> payment(BuildContext context) async {
    setLoading(true);
    _myrepo.payment(paymentResponse).then((value) {
      setLoading(false);
      log('Payment success');
    }).onError((error, stackTrace) {
      setLoading(false);
      log(error.toString());
    });
  }
}
