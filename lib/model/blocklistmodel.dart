// To parse this JSON data, do
//
//     final blockModel = blockModelFromJson(jsonString);

import 'dart:convert';

List<BlockModel> blockModelFromJson(String str) =>
    List<BlockModel>.from(json.decode(str).map((x) => BlockModel.fromJson(x)));

String blockModelToJson(List<BlockModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlockModel {
  BlockModel({
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

  factory BlockModel.fromJson(Map<String, dynamic> json) => BlockModel(
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
