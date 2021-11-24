// To parse this JSON data, do
//
//     final typeModel = typeModelFromJson(jsonString);

import 'dart:convert';

import 'dart:ffi';

availModel availModelFromJson(String str) => availModel.fromJson(json.decode(str));

String availModelToJson(availModel data) => json.encode(data.toJson());

class availModel {
  availModel({
    required this.status,
    required this.message,
    required   this.data,
  });

  String status;

  String message;
  List<Datum> data;

  factory availModel.fromJson(Map<String, dynamic> json) => availModel(
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

    required this.date,
    required this.end_time,
    required this.start_time,
    required this.created_at,
    required this.updated_at,



  });

  String employee_id;

  String date;
  String start_time;
  String end_time;
  String created_at;
  String id;
  String updated_at;


  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    employee_id: json["employee_id"],

    date: json["date"],
    start_time: json["start_time"],
    end_time: json["end_time"],
    created_at: json["created_at"],
    updated_at: json["updated_at"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,

    "employee_id":employee_id,

    "date":date,
    "start_time":start_time,
    "end_time":end_time,

    "created_at": created_at,
    "updated_at": updated_at,





  };
}
