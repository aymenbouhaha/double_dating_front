import 'dart:convert';

import 'couple.dart';

DoubleDateRequest doubleDateRequestFromJson(String str) => DoubleDateRequest.fromJson(json.decode(str));

List<DoubleDateRequest> doubleDateRequestListFromJson(String str) => List<DoubleDateRequest>.from(json.decode(str).map((x) => DoubleDateRequest.fromJson(x)));


class DoubleDateRequest {
  int? id;
  String? place;
  String? date;
  Couple? sender;
  Couple? recipient;

  DoubleDateRequest({
    this.id,
    this.place,
    this.date,
    this.sender,
    this.recipient
  });

  factory DoubleDateRequest.fromJson(Map<String, dynamic> json) => DoubleDateRequest(
    id: json["id"],
    place: json["place"],
    date: json["date"],
    sender : coupleFromJson(json["sender"]),
    recipient: coupleFromJson(json["recipient"])
  );

}
