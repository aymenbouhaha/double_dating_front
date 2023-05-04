import 'dart:convert';

Interest interestFromJson(String str) => Interest.fromJson(json.decode(str));

String interestToJson(Interest data) => json.encode(data.toJson());

List<Interest> interestListFromJson(String str) => List<Interest>.from(json.decode(str).map((x) => Interest.fromJson(x)));

String interestListToJson(List<Interest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Interest {
  int? id;
  String? name;

  Interest({
     this.id,
     this.name,
  });

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
