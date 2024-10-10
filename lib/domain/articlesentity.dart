class ArticlesEntity {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final DateTime publshedAt;
  final String content;
  final String articleUrl;

  ArticlesEntity({
    required this.title,
    required this.author,
    required this.description,
    required this.urlToImage,
    required this.publshedAt,
    required this.content,
    required this.articleUrl,
  });
  // Override the toString() method to display a meaningful string representation
  @override
  String toString() {
    return 'Title: $title, Author: $author, PublishedAt: $publshedAt, Description: $description, UrlToImage: $urlToImage, Content: $content, ArticleUrl: $articleUrl,';
  }
}
