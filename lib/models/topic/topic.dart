import 'package:intl/intl.dart';

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
      dateTime: map['dateTime'] as String,
      locale: map['locale'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'authorName': authorName,
      'authorEmail': authorEmail,
      'dateTime': dateTime,
      'locale': locale,
    };
  }

  final String id;
  final String title;
  final String authorName;
  final String authorEmail;
  final String dateTime;
  final String locale;

  String get displayDateTime => DateFormat('d/M/y  H:m').format(DateTime.parse(dateTime));
}
