
import 'package:flutter/material.dart';

import '../../data/models/post_model.dart';


class PostCard extends StatelessWidget {
  String profileImage;
  String username;
  String postText;
  String tag;
  bool isLiked;
  List<Comment> comments;

  PostCard({
    required this.profileImage,
    required this.username,
    required this.postText,
    required this.tag,
    required this.isLiked,
    required this.comments
  });


  @override
  Widget build(BuildContext context) {

    void _toggleLike() {
      //todo: add toggle effect using bloc
    }

    void _showPopupMenu() async {
      await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(1000, 1000, 0, 0),
        items: [
          PopupMenuItem(
            child: Text("Edit"),
            value: "edit",
          ),
          PopupMenuItem(
            child: Text("Delete"),
            value: "delete",
          ),
        ],
        elevation: 8.0,
      );
    }

    void _openCommentSheet() {


      TextEditingController _commentController = TextEditingController();

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                            ),
                            title: Text(comments[index].username),
                            subtitle: Text(comments[index].commentText),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Write a comment...',
                      ),
                    ),
                    SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_commentController.text.isNotEmpty) {
                          setState(() {
                            comments.add(
                              Comment(
                                  profileImage: "",
                                  username: 'xyz',
                                  commentText: _commentController.text)

                            );
                            _commentController.clear();
                          });
                        }
                      },
                      child: Text('Post Comment'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(profileImage),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      username,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Text('Edit'),
                        value: 'edit',
                      ),
                      PopupMenuItem(
                        child: Text('Delete'),
                        value: 'delete',
                      ),
                      PopupMenuItem(
                        child: Text('Save'),
                        value: 'Save',
                      ),
                    ];
                  },
                  onSelected: (String value) {
                    if (value == 'edit') {
                      // Handle edit action
                    } else if (value == 'delete') {
                      // Handle delete action
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              postText,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  icon: isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                  onPressed: _toggleLike,
                ),
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: _openCommentSheet,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

