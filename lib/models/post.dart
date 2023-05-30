import 'dart:convert';

import 'package:double_dating_front/models/Couple.dart';

import 'media.dart';

List<Post> postListFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

Post postFromJson(String str) => Post.fromJson(json.decode(str));


class Post {
  int? id;
  String? caption;
  String? creationDate;
  List<Media>? medias;
  Couple? user;

  Post({
    this.user,
     this.id,
     this.caption,
     this.creationDate,
    this.medias,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    caption: json["caption"],
    creationDate: json["creationDate"],
      medias: json["medias"] !=null? mediaListFromJson(jsonEncode(json["medias"])) : null,
    user: json["couple"]!=null  ? coupleFromJson(jsonEncode(json["couple"])) : null
  );


}
