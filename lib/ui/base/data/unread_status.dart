class UnreadStatus {
  bool notiUnread;
  bool chatUnread;

  UnreadStatus.fromMap(Map<String, dynamic> map)
      : notiUnread = map['notiUnread'],
        chatUnread = map['chatUnread'];
}
