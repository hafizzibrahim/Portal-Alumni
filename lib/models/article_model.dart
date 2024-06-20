class ArticleModel {
  final int id;
  final String title, content;

  ArticleModel({
    required this.title, required this.content, required this.id});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }
}
