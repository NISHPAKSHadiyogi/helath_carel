// To parse this JSON data, do
//
//     final typeModel = typeModelFromJson(jsonString);

import 'dart:convert';

notificationModel notificationModelFromJson(String str) => notificationModel.fromJson(json.decode(str));

String notificationModelToJson(notificationModel data) => json.encode(data.toJson());

class notificationModel {
  notificationModel({
    required this.status,
    required this.message,
    required   this.data,
  });

  String status;

  String message;
  List<Datum> data;

  factory notificationModel.fromJson(Map<String, dynamic> json) => notificationModel(
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

    required this.employee_id,
    required this.title,
    required this.description,
    required this.created_at,


  });

  String id;
  String employee_id;
  String title;
  String description;
  String created_at;


  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    employee_id: json["employee_id"],
    title: json["title"],
    description: json["description"],
    created_at: json["created_at"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,

    "employee_id":employee_id,
    "title":title,
    "description":description,
    "created_at":created_at,






  };
}
