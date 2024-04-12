import 'package:flutter/material.dart';

class Post {
  final String profileImage;
  final String username;
  final String postText;
  final String tag;
  bool isLiked;
  final List<Comment> comments;

  Post({
    required this.profileImage,
    required this.username,
    required this.postText,
    required this.tag,
    this.isLiked = false,
    this.comments = const [],
  });
}

class Comment {
  final String profileImage;
  final String username;
  final String commentText;

  Comment({
    required this.profileImage,
    required this.username,
    required this.commentText,
  });
}
