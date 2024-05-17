import 'dart:convert';
import 'dart:typed_data';

List<Media> mediaListFromJson(String str) => List<Media>.from(json.decode(str).map((x) => Media.fromJson(x)));

Media mediaFromJson(String str) => Media.fromJson(json.decode(str));

class Media {
  int? id;
  String? name;
  String? type;
  Buffer? data;

  Media({
    this.id,
    this.name,
    this.type,
    this.data,
  });

  factory Media.fromJson(Map<String, dynamic> json){
    var data;

    if(json["data"] is List<dynamic>){
      data=Buffer(
          type : "Buffer",
          data : Uint8List.fromList(List<int>.from(json["data"].map((x) => x)))
      );
    }else{
      data=bufferFromJson(jsonEncode(json["data"]));
    }

    return Media(
      id: json["id"],
      name: json["name"],
      type: json["type"],
      data: data,
    );
  }

}


Buffer bufferFromJson(String str) => Buffer.fromJson(json.decode(str));


class Buffer {
  String type;
  Uint8List data;

  Buffer({
    required this.type,
    required this.data,
  });

  factory Buffer.fromJson(Map<String, dynamic> json) => Buffer(
    type: json["type"],
    data: Uint8List.fromList(List<int>.from(json["data"].map((x) => x))),
  );

}

