import 'dart:convert';

import 'media.dart';
import 'person.dart';

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
  Media? profilePicture;

  Couple({
     this.id,
     this.username,
     this.email,
     this.anniversary,
    this.firstPartner,
    this.interest,
    this.secondPartner,
    this.profilePicture
  });

  factory Couple.fromJson(Map<String, dynamic> json){

    return Couple(
        id: json["id"] ?? null,
        username: json["username"]  ,
        email: json["email"] ,
        profilePicture: json["profilePicture"]!=null?  mediaFromJson(jsonEncode(json["profilePicture"])): null ,
        anniversary: json["anniversary"] !=null ? DateTime.tryParse(json["anniversary"]) : null,
        firstPartner: json["firstPartner"] !=null ? personFromJson(jsonEncode(json["firstPartner"])) : null,
        secondPartner: json["secondPartner"] !=null ? personFromJson(jsonEncode(json["secondPartner"])) : null,
        interest: json["interest"]!=null  ? interestListFromJson(jsonEncode(json["interest"])) : null
    );

  }


}
