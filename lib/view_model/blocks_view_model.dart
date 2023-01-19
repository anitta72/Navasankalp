import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Repository/block_repository.dart';
import 'package:flutter_application_1/model/blocklistmodel.dart';

class BlocksViewModel with ChangeNotifier {
  final _myBlockRepo = BlocKRepository();
  List<BlockModel> blockList = List.empty(growable: true);
  bool showLoader = false;

  void setBlockLoading(bool value) {
    showLoader = value;
    notifyListeners();
  }

  Future<void> fetchBlock(BuildContext context) async {
    try {
      setBlockLoading(true);
      blockList = await _myBlockRepo.fetchBlocks();
      setBlockLoading(false);

      notifyListeners();
    } catch (e) {
      setBlockLoading(false);
      notifyListeners();
      rethrow;
    }
  }
}
