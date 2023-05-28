import 'package:learn_world/models/models.dart';

class Content {
  const Content({
    required this.id,
    required this.en,
    required this.ky,
    required this.ru,
    required this.tr,
    required this.articles,
    this.svgUrl,
  });

  factory Content.fromJson(Map<String, dynamic> map) {
    return Content(
      id: map['id'] as String,
      en: map['en'] as String,
      ky: map['ky'] as String,
      ru: map['ru'] as String,
      tr: map['tr'] as String,
      svgUrl: map['svgUrl'] != null ? map['svgUrl'] as String : null,
      articles: List<Article>.from(
        (map['articles'] as List<dynamic>).map<Article>((x) => Article.fromJson(x as Map<String, dynamic>)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'en': en,
      'ky': ky,
      'ru': ru,
      'tr': tr,
      'svgUrl': svgUrl,
      'articles': articles.map((x) => x.toJson()).toList(),
    };
  }

  final String id;
  final String en;
  final String ky;
  final String ru;
  final String tr;
  final String? svgUrl;
  final List<Article> articles;

  String getName(MyLocale myLocale) => switch (myLocale) {
        MyLocale.en => en,
        MyLocale.ky => ky,
        MyLocale.ru => ru,
        MyLocale.tr => tr,
      };
}
