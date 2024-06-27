class Job {
  final int id;
  final String title;
  final String description;
  final String content;
  final String imagePath;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.imagePath
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      content: json['content'],
      imagePath: json['image_path'],
    );
  }
}