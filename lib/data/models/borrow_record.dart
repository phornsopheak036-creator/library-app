enum RecordStatus { borrowed, returned, overdue }

class BorrowRecord {
  final String bookTitle;
  final String memberName;
  final DateTime borrowDate;
  final DateTime dueDate;
  final RecordStatus status;

  const BorrowRecord({
    required this.bookTitle,
    required this.memberName,
    required this.borrowDate,
    required this.dueDate,
    required this.status,
  });
}
