import 'package:learn_world/models/models.dart';

class Article {
  const Article({
    required this.id,
    required this.en,
    required this.ky,
    required this.ru,
    required this.tr,
  });

  factory Article.fromJson(Map<String, dynamic> map) {
    return Article(
      id: map['id'] as String,
      en: map['en'] as String,
      ky: map['ky'] as String,
      ru: map['ru'] as String,
      tr: map['tr'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'en': en, 'ky': ky, 'ru': ru, 'tr': tr};
  }

  final String id;
  final String en;
  final String ky;
  final String ru;
  final String tr;

  String getName(MyLocale myLocale) => switch (myLocale) {
        MyLocale.en => en,
        MyLocale.ky => ky,
        MyLocale.ru => ru,
        MyLocale.tr => tr,
      };
}
