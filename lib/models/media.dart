import 'dart:convert';
import 'dart:typed_data';

List<Media> mediaListFromJson(String str) => List<Media>.from(json.decode(str).map((x) => Media.fromJson(x)));

Media mediaFromJson(String str) => Media.fromJson(json.decode(str));

class Media {
  int? id;
  String? name;
  String? type;
  Uint8List? data;

  Media({
    this.id,
    this.name,
    this.type,
    this.data,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    data: json["data"],
  );

}
