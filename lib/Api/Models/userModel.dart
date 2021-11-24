// To parse this JSON data, do
//
//     final typeModel = typeModelFromJson(jsonString);

import 'dart:convert';

userModel userModelFromJson(String str) => userModel.fromJson(json.decode(str));

String userModelToJson(userModel data) => json.encode(data.toJson());

class userModel {
  userModel({
    required this.status,
    required this.message,
    required   this.data,
  });

  String status;

  String message;
  List<Datum> data;

  factory userModel.fromJson(Map<String, dynamic> json) => userModel(
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

    required this.username,
    required this.unique_id,
    required this.image,
    required this.email,
    required this.mobile_no,
    required this.fcm_id,
    required  this.device_id,
    required this.firstname,
    required this.lastname,
    required this.address,
    required this.country,
    required  this.town,
    required this.role,
    required this.is_active,
    required this.is_admin,
    required  this.last_ip,
    required this.created_at,
    required this.updated_at,
    required this.deleted,



  });

  String id;
  String username;
  String unique_id;
  String image;
  String email;
  String mobile_no;
  String fcm_id;
  String device_id;
   String firstname;
 String lastname;
  String address;
 String country;
String  town;
String role;
 String is_active;
 String is_admin;
 String  last_ip;
 String created_at;
  String updated_at;
 String deleted;


  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    username: json["username"],
    unique_id: json["unique_id"],
    image: json["image"],
    email: json["email"],
    mobile_no: json["mobile_no"],
    fcm_id: json["fcm_id"],
    device_id: json["device_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    address: json["address"],
    country: json["country"],
    town: json["town"],
    role: json["role"],
    is_active: json["is_active"],
    is_admin: json["is_admin"],
    last_ip: json["last_ip"],
    created_at: json["created_at"],
    updated_at: json["updated_at"],
    deleted: json["deleted"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,

    "username":username,
    "unique_id":unique_id,
    "image":image,
    "email":email,
    "mobile_no":mobile_no,

    "fcm_id": fcm_id,
    "device_id": device_id,

    "firstname": firstname,
    "lastname": lastname,


    "address": address,
    "country": country,
    "town": town,
    "role": role,
    "is_active": is_active,
    "is_admin": is_admin,
    "last_ip": last_ip,
    "created_at": created_at,
    "updated_at": updated_at,
    "deleted": deleted




  };
}
