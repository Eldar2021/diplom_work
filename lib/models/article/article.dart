class Article {
  const Article({
    required this.id,
    required this.name,
    required this.locale,
  });

  factory Article.fromJson(Map<String, dynamic> map) {
    return Article(
      id: map['id'] as String,
      name: map['name'] as String,
      locale: map['locale'] as String,
    );
  }

  final String id;
  final String name;
  final String locale;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'locale': locale,
    };
  }
}
