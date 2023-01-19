// To parse this JSON data, do
//
//     final paymentModal = paymentModalFromJson(jsonString);

import 'dart:convert';

PaymentModal? paymentModalFromJson(String str) =>
    PaymentModal.fromJson(json.decode(str));

String paymentModalToJson(PaymentModal? data) => json.encode(data!.toJson());

class PaymentModal {
  PaymentModal({
    this.data,
  });

  String? data;

  factory PaymentModal.fromJson(Map<String, dynamic> json) => PaymentModal(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
