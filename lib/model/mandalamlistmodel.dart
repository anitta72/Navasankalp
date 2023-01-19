// To parse this JSON data, do
//
//     final mandalamModel = mandalamModelFromJson(jsonString);

import 'dart:convert';

MandalamModel mandalamModelFromJson(String str) =>
    MandalamModel.fromJson(json.decode(str));

String mandalamModelToJson(MandalamModel data) => json.encode(data.toJson());

class MandalamModel {
  MandalamModel({
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

  factory MandalamModel.fromJson(Map<String, dynamic> json) => MandalamModel(
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
