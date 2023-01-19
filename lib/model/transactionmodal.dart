// To parse this JSON data, do
//
//     final transactionModal = transactionModalFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_application_1/Sharedprefs.dart';

TransactionModal? transactionModalFromJson(String str) =>
    TransactionModal.fromJson(json.decode(str));

String transactionModalToJson(TransactionModal? data) =>
    json.encode(data!.toJson());

class TransactionModal {
  TransactionModal({
    this.pId,
    this.phone,
    this.amount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.paymentId,
  });

  int? pId;
  String? phone;
  String? amount;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? paymentId;

  factory TransactionModal.fromJson(Map<String, dynamic> json) =>
      TransactionModal(
        pId: json["p_id"],
        phone: json["phone"],
        amount: json["amount"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        paymentId: json["payment_id"],
      );

  Map<String, dynamic> toJson() => {
        "p_id": pId,
        "phone": phone,
        "amount": amount,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "payment_id": paymentId,
      };

  Map<String, dynamic> toServerMap() => {
        'payment_id': paymentId ?? "",
        'phone': SharedPrefs.phone.toString(),
        'amount': amount,
        'status': status
      };
}
