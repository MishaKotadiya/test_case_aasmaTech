import 'package:flutter/material.dart';

import '../../../../core/shared/app_string.dart';
import '../../data/models/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationItem> notifications = [
    NotificationItem(
      avatarUrl: 'https://via.placeholder.com/150',
      text: 'You have a new message',
      user: 'xyz1',
      isRead: false,
    ),
    NotificationItem(
      avatarUrl: 'https://via.placeholder.com/150',
      text: 'John liked your post',
      user: 'xyz2',
      isRead: true,
    ),
    NotificationItem(
      avatarUrl: 'https://via.placeholder.com/150',
      text: 'New follower: Jane',
      user: 'xyz3',
      isRead: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.notification),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //Todo: add toggle effect
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(notifications[index].avatarUrl),
              ),
              title: Text(
                notifications[index].user,
                style: TextStyle(fontWeight: notifications[index].isRead ? FontWeight.normal : FontWeight.bold),
              ),
              subtitle: Text(
                notifications[index].text,
                style: TextStyle(fontWeight: notifications[index].isRead ? FontWeight.normal : FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
