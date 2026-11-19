enum BookStatus { available, borrowed, overdue }

class Book {
  final String id;
  final String title;
  final String author;
  final String category;
  final String isbn;
  final int copies;
  final BookStatus status;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    this.isbn = '978-0-00-000000-0',
    this.copies = 1,
    this.status = BookStatus.available,
  });
}
