class Topic {
  const Topic({
    required this.id,
    required this.title,
    required this.authorName,
    required this.authorEmail,
    required this.dateTime,
    required this.locale,
  });

  factory Topic.fromJson(Map<String, dynamic> map) {
    return Topic(
      id: map['id'] as String,
      title: map['title'] as String,
      authorName: map['authorName'] as String,
      authorEmail: map['authorEmail'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      locale: map['locale'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'authorName': authorName,
      'authorEmail': authorEmail,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'locale': locale,
    };
  }

  final String id;
  final String title;
  final String authorName;
  final String authorEmail;
  final DateTime dateTime;
  final String locale;
}
