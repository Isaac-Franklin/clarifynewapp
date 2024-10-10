class FetchByCategoryEntity {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final DateTime publshedAt;
  final String content;

  FetchByCategoryEntity({
    required this.title,
    required this.author,
    required this.description,
    required this.urlToImage,
    required this.publshedAt,
    required this.content,
  });
}

class FetchByCategoryEntityImage {
  List urlToImage;

  FetchByCategoryEntityImage({required this.urlToImage});
}
