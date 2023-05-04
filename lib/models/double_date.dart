import 'dart:convert';

import 'couple.dart';

DoubleDate doubleDateFromJson(String str) => DoubleDate.fromJson(json.decode(str));

List<DoubleDate> doubleDateListFromJson(String str) => List<DoubleDate>.from(json.decode(str).map((x) => DoubleDate.fromJson(x)));



class DoubleDate {
  int? id;
  String? place;
  String? date;
  Couple? firstCouple;
  Couple? secondCouple;


  DoubleDate({
    this.id,
    this.place,
    this.date,
    this.firstCouple,
    this.secondCouple
  });

  factory DoubleDate.fromJson(Map<String, dynamic> json) => DoubleDate(
    id: json["id"],
    place: json["place"],
    date: json["date"],
    firstCouple: coupleFromJson(json["firstCouple"]),
    secondCouple: coupleFromJson(json["secondCouple"])
  );


}
