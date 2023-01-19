// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
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
    this.message,
  });

  int? id;
  int? uId;
  String? userName;
  String? name;
  dynamic address;
  dynamic mandalam;
  dynamic booth;
  dynamic block;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  String? message;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        id: json["id"] == null ? null : json["id"],
        uId: json["u_id"] == null ? null : json["u_id"],
        userName: json["user_name"] == null ? null : json["user_name"],
        name: json["name"] == null ? null : json["name"],
        address: json["address"],
        mandalam: json["mandalam"],
        booth: json["booth"],
        block: json["block"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "u_id": uId == null ? null : uId,
        "user_name": userName == null ? null : userName,
        "name": name == null ? null : name,
        "address": address,
        "mandalam": mandalam,
        "booth": booth,
        "block": block,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
        "message": message == null ? null : message,
      };
}

// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.uId,
    this.phoneNumber,
    this.userName,
    this.name,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.message,
  });

  int? uId;
  String? phoneNumber;
  String? userName;
  String? name;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        uId: json["u_id"] == null ? null : json["u_id"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        userName: json["user_name"] == null ? null : json["user_name"],
        name: json["name"] == null ? null : json["name"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        id: json["id"] == null ? null : json["id"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "u_id": uId == null ? null : uId,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "user_name": userName == null ? null : userName,
        "name": name == null ? null : name,
        "updated_at": updatedAt == null ? null : updatedAt,
        "created_at": createdAt == null ? null : createdAt,
        "id": id == null ? null : id,
        "message": message == null ? null : message,
      };
}
