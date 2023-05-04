import 'dart:convert';

import 'couple.dart';

Request requestFromJson(String str) => Request.fromJson(json.decode(str));

String requestToJson(Request data) => json.encode(data.toJson());

class Request {
  int? id;
  String? status;
  Couple? sender;
  Couple? reciever;

  Request({
     this.id,
     this.status,
    this.sender,
    this.reciever
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    id: json["id"],
    status: json["status"],
      sender : coupleFromJson(json["sender"]),
      reciever: coupleFromJson(json["reciever"])
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
  };
}
