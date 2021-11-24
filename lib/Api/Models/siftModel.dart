// To parse this JSON data, do
//
//     final typeModel = typeModelFromJson(jsonString);

import 'dart:convert';

import 'dart:ffi';

siftModel siftModelFromJson(String str) => siftModel.fromJson(json.decode(str));

String siftModelToJson(siftModel data) => json.encode(data.toJson());

class siftModel {
  siftModel({
    required this.status,
    required this.message,
    required   this.data,
  });

  String status;

  String message;
  List<Datum> data;

  factory siftModel.fromJson(Map<String, dynamic> json) => siftModel(
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

    required this.job_name,
    required this.client_name,
    required this.shift_date,
    required this.shift_end_time,
    required this.shift_start_time,
    required this.address,
    required this.total_work_time,



  });

  String job_name;
  String client_name;
  String shift_date;
  String shift_start_time;
  String shift_end_time;
  String address;
  String id;
  String total_work_time;


  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    job_name: json["job_name"],
    client_name: json["client_name"],
    shift_date: json["shift_date"],
    shift_start_time: json["shift_start_time"],
    shift_end_time: json["shift_end_time"],
    address: json["address"],
    total_work_time: json["total_work_time"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,

    "job_name":job_name,
    "client_name":client_name,
    "shift_date":shift_date,
    "shift_start_time":shift_start_time,
    "shift_end_time":shift_end_time,

    "address": address,
    "total_work_time": total_work_time,





  };
}
