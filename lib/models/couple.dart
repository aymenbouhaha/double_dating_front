import 'dart:convert';

import 'package:double_dating_front/models/person.dart';

import 'interest.dart';

Couple coupleFromJson(String str) => Couple.fromJson(json.decode(str));

List<Couple> coupleListFromJson(String str) => List<Couple>.from(json.decode(str).map((x) => Couple.fromJson(x)));

class Couple {
  int? id;
  String? username;
  String? email;
  DateTime? anniversary;
  Person? firstPartner;
  Person? secondPartner;
  List<Interest>? interest;

  Couple({
     this.id,
     this.username,
     this.email,
     this.anniversary,
    this.firstPartner,
    this.interest,
    this.secondPartner
  });

  factory Couple.fromJson(Map<String, dynamic> json) => Couple(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    anniversary: json["anniversary"],
    firstPartner: personFromJson(json["firstPartner"]),
    secondPartner: personFromJson(json["secondPartner"]),
    interest: interestListFromJson(json["interest"])
  );


}
