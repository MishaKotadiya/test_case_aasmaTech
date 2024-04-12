class NotificationItem {
  final String avatarUrl;
  final String text;
  final String user;
  late final bool isRead;

  NotificationItem({
    required this.avatarUrl,
    required this.text,
    required this.user,
    required this.isRead
  });
}