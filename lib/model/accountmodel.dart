// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

AccountModel accountModelFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  AccountModel({
    this.id,
    this.uId,
    this.userName,
    this.name,
    this.address,
    this.mandalam,
    this.booth,
    this.block,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? uId;
  String? userName;
  String? name;
  String? address;
  String? mandalam;
  String? booth;
  String? block;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json["id"] == null ? null : json["id"],
        uId: json["u_id"] == null ? null : json["u_id"],
        userName: json["user_name"] == null ? null : json["user_name"],
        name: json["name"] == null ? null : json["name"],
        address: json["address"] == null ? null : json["address"],
        mandalam: json["mandalam"] == null ? null : json["mandalam"],
        booth: json["booth"] == null ? null : json["booth"],
        block: json["block"] == null ? null : json["block"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "u_id": uId == null ? null : uId,
        "user_name": userName == null ? null : userName,
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "mandalam": mandalam == null ? null : mandalam,
        "booth": booth == null ? null : booth,
        "block": block == null ? null : block,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
      };
}

//..............................................

// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

// import 'dart:convert';

// AccountModel? accountModelFromJson(String str) =>
//     AccountModel.fromJson(json.decode(str));

// String accountModelToJson(AccountModel? data) => json.encode(data!.toJson());

// class AccountModel {
//   AccountModel({
//     this.id,
//     this.uId,
//     this.userName,
//     this.name,
//     this.address,
//     this.mandalam,
//     this.booth,
//     this.block,
//     this.phoneNumber,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? id;
//   int? uId;
//   String? userName;
//   dynamic name;
//   dynamic address;
//   dynamic mandalam;
//   dynamic booth;
//   dynamic block;
//   String? phoneNumber;
//   String? createdAt;
//   String? updatedAt;

//   factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
//         id: json["id"],
//         uId: json["u_id"],
//         userName: json["user_name"],
//         name: json["name"],
//         address: json["address"],
//         mandalam: json["mandalam"],
//         booth: json["booth"],
//         block: json["block"],
//         phoneNumber: json["phone_number"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "u_id": uId,
//         "user_name": userName,
//         "name": name,
//         "address": address,
//         "mandalam": mandalam,
//         "booth": booth,
//         "block": block,
//         "phone_number": phoneNumber,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }
