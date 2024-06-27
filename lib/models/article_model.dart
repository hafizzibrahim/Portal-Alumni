class ArticleModel {
  final int id;
  final String title, content;
  final String imagePath;

  ArticleModel({
    required this.title, required this.content, required this.id, required this.imagePath});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      imagePath: json['image_path'],
    );
  }
}
