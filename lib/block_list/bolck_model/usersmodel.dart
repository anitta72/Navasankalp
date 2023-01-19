// To parse this JSON data, do
//
// final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

List<UsersModel> usersModelFromJson(String str) =>
    List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String usersModelToJson(List<UsersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersModel {
  UsersModel({
    this.id,
    this.name,
    this.parentId,
    this.president,
    this.phone,
  });

  int? id;
  String? name;
  int? parentId;
  String? president;
  String? phone;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        president: json["president"] == null ? null : json["president"],
        phone: json["phone"] == null ? null : json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "parent_id": parentId == null ? null : parentId,
        "president": president == null ? null : president,
        "phone": phone == null ? null : phone,
      };
}
