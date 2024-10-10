import 'package:clarifyapp_blocversion/domain/fetchbycatgoryentity.dart';

class FetchByCategory {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final DateTime publshedAt;
  final String content;
  final String articleUrl;

  FetchByCategory({
    required this.title,
    required this.author,
    required this.description,
    required this.urlToImage,
    required this.publshedAt,
    required this.content,
    required this.articleUrl,
  });

  factory FetchByCategory.fromJson(Map<String, dynamic> json) =>
      FetchByCategory(
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

  FetchByCategoryEntity toEntity() {
    return FetchByCategoryEntity(
      title: title,
      author: author,
      description: description,
      urlToImage: urlToImage,
      content: content,
      publshedAt: publshedAt,
    );
  }
}

// Fetch Images

class FetchByCategoryImage {
  final List urlToImage;

  FetchByCategoryImage({
    required this.urlToImage,
  });

  factory FetchByCategoryImage.fromJson(Map<String, dynamic> json) =>
      FetchByCategoryImage(
        urlToImage: json["urlToImage"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "urlToImage": urlToImage,
      };

  FetchByCategoryEntityImage toEntity() {
    return FetchByCategoryEntityImage(
      urlToImage: urlToImage,
    );
  }
}
