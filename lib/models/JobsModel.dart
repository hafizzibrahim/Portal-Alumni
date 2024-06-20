class Job {
  final int id;
  final String title;
  final String description;
  final String content;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      content: json['content'],
    );
  }
}