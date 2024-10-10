import 'package:clarifyapp_blocversion/domain/articlesentity.dart';

class Article {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final DateTime publshedAt;
  // final DateTime publshedAt;
  final String content;
  final String articleUrl;

  const Article({
    required this.title,
    required this.author,
    required this.description,
    required this.urlToImage,
    required this.publshedAt,
    required this.content,
    required this.articleUrl,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"] ?? "",
        author: json["author"] ?? "",
        description: json["description"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        content: json["content"] ?? "",
        articleUrl: json["articleUrl"] ?? "",
        publshedAt: json["publshedAt"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "description": description,
        "urlToImage": urlToImage,
        "content": content,
        "articleUrl": articleUrl,
        "publshedAt": publshedAt.toIso8601String(),
      };

  ArticlesEntity toEntity(Article artiles) {
    return ArticlesEntity(
      title: title,
      author: author,
      description: description,
      urlToImage: urlToImage,
      content: content,
      articleUrl: articleUrl,
      publshedAt: publshedAt,
    );
  }
}
