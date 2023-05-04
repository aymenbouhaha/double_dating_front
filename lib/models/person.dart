import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

List<Person> personListFromJson(String str) => List<Person>.from(json.decode(str).map((x) => Person.fromJson(x)));

String personListToJson(List<Person> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Person {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? birthDate;

  Person({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.birthDate,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNumber: json["phoneNumber"],
    birthDate: json["birthDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
    "birthDate": birthDate,
  };
}
