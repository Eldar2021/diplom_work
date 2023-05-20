import 'package:learn_world/models/models.dart';

class Content {
  const Content({
    required this.id,
    required this.name,
    this.svgUrl,
    required this.articles,
  });

  final String id;
  final String name;
  final String? svgUrl;
  final List<Article> articles;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'svgUrl': svgUrl,
      'articles': articles.map((x) => x.toJson()).toList(),
    };
  }

  factory Content.fromJson(Map<String, dynamic> map) {
    return Content(
      id: map['id'] as String,
      name: map['name'] as String,
      svgUrl: map['svgUrl'] != null ? map['svgUrl'] as String : null,
      articles: List<Article>.from(
        (map['articles'] as List<dynamic>).map<Article>(
          (x) => Article.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
