import 'dart:convert';

import 'package:double_dating_front/models/Couple.dart';

import 'media.dart';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

List<Message> messageListFromJson(String str) => List<Message>.from(json.decode(str).map((x) => Message.fromJson(x)));

String messageListToJson(List<Message> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Message {
  int? id;
  String? content;
  String? status;
  Couple? author;
  DateTime? creationDate;
  List<Media>? attachment;

  Message({
     this.id,
     this.content,
     this.status,
     this.creationDate,
    this.attachment,
    this.author
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    content: json["content"],
    status: json["status"],
    author: json["author"]!=null ? coupleFromJson(jsonEncode(json["author"])) : null,
    creationDate: json["creationDate"]!=null ? DateTime.tryParse(json["creationDate"]) : null,
    attachment: json["attachment"] !=null ? mediaListFromJson(jsonEncode(json["attachment"])) : null
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "status": status,
    "creationDate": creationDate,
  };
}
