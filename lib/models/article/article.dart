import 'package:learn_world/models/models.dart';

class Article {
  const Article({
    required this.ids,
    required this.en,
    required this.ky,
    required this.ru,
    required this.tr,
  });

  factory Article.fromJson(Map<String, dynamic> map) {
    return Article(
      ids: List<String>.from(map['id'] as List<dynamic>),
      en: map['en'] as String,
      ky: map['ky'] as String,
      ru: map['ru'] as String,
      tr: map['tr'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': ids, 'en': en, 'ky': ky, 'ru': ru, 'tr': tr};
  }

  final List<String> ids;
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
