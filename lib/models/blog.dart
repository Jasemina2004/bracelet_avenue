class Blog {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String date;
  final String author;
  final String? content;

  Blog({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date, // Shtoni këtë
    required this.author,
    this.content,
  });
}
