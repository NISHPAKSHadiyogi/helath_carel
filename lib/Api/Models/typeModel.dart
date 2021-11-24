// To parse this JSON data, do
//
//     final typeModel = typeModelFromJson(jsonString);

import 'dart:convert';

TypeModel typeModelFromJson(String str) => TypeModel.fromJson(json.decode(str));

String typeModelToJson(TypeModel data) => json.encode(data.toJson());

class TypeModel {
  TypeModel({
    required this.status,
    required this.message,
    required   this.data,
  });

  String status;

  String message;
  List<Datum> data;

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        status: json["status"],

        message: json["message"],
     //  data: json["sjdj"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,

        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.created_by,
    required this.sort_order,
    required this.is_active,
    required this.faq_type_id,
    required this.question,
    required this.answer,

  });

  String id;
  String name;
  String created_by;
  String sort_order;
  String is_active;
  String faq_type_id;
  String question;
  String answer;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
    created_by: json["created_by"],
    sort_order: json["sort_order"],
    is_active: json["is_active"],
    faq_type_id: json["faq_type_id"],
    question: json["question"],
    answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    "created_by":created_by,
    "sort_order":sort_order,
    "is_active":is_active,
    "faq_type_id":faq_type_id,
    "question":question,
    "answer":answer,





      };
}
