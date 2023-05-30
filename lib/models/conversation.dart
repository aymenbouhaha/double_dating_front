import 'dart:convert';

import 'couple.dart';
import 'message.dart';

Conversation conversationFromJson(String str) => Conversation.fromJson(json.decode(str));

List<Conversation> conversationListFromJson(String str) => List<Conversation>.from(json.decode(str).map((x) => Conversation.fromJson(x)));

class Conversation {
  int? id;
  Couple? author;
  Couple? recipient;
  Message? lastMessage;
  List<Message>? messages;

  Conversation({
    this.id,
    this.author,
    this.lastMessage,
    this.messages,
    this.recipient
  });

  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
    id: json["id"],
    author: json["author"]!=null ? coupleFromJson(jsonEncode(json["author"])) : null,
    recipient: json["recipient"]!=null? coupleFromJson(jsonEncode(json["recipient"])) : null,
    lastMessage: json["lastMessage"] !=null ? messageFromJson(jsonEncode(json["lastMessage"])) : null
  );


}
