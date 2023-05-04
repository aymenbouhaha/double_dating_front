import 'dart:convert';

import 'media.dart';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

List<Message> messageListFromJson(String str) => List<Message>.from(json.decode(str).map((x) => Message.fromJson(x)));

String messageListToJson(List<Message> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Message {
  int? id;
  String? content;
  String? status;
  DateTime? creationDate;
  List<Media>? attachment;

  Message({
     this.id,
     this.content,
     this.status,
     this.creationDate,
    this.attachment
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    content: json["content"],
    status: json["status"],
    creationDate: json["creationDate"],
    attachment: mediaListFromJson(json["attachment"])
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "status": status,
    "creationDate": creationDate,
  };
}
