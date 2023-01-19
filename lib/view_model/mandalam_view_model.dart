import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Repository/mandalam_repository.dart';
import 'package:flutter_application_1/model/mandalamlistmodel.dart';

class MandalamViewModel with ChangeNotifier {
  final _myRepo = MandalamRepository();
  List<MandalamModel> mandalamList = List.empty(growable: true);
  bool loading = false;

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> GetMandalamByBlock(int ID, BuildContext context) async {
    try {
      setLoading(true);
      mandalamList = await _myRepo.GetMandalamByBlock(ID);
      notifyListeners();
      setLoading(false);
      notifyListeners();
    } catch (e) {
      setLoading(false);
      rethrow;
    }
  }
}
