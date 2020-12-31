class Blog{
  String title;
  String author;
  String description;
  String category;
  int numberOfLike;
  String createdAt;
  String imageUrl;
  bool isBookMark;

  Blog({
    this.author,
    this.title,
    this.category,
    this.imageUrl,
    this.createdAt,
    this.description,
    this.numberOfLike,
    this.isBookMark
  });
}