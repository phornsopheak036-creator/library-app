import 'package:num_library/data/models/book.dart';
import 'package:num_library/data/models/borrow_record.dart';
import 'package:num_library/data/models/member.dart';

class MockData {
  MockData._();

  static const categories = ['All', 'History', 'Fiction', 'Science', 'Art'];

  static const books = [
    Book(id: '1', title: 'History of Cambodia', author: 'David Chandler', category: 'History', copies: 3),
    Book(id: '2', title: 'Khmer Folk Tales', author: 'Sok Dara', category: 'Fiction', copies: 2, status: BookStatus.borrowed),
    Book(id: '3', title: 'Mekong Story', author: 'Vann Sophea', category: 'Art', copies: 1, status: BookStatus.overdue),
    Book(id: '4', title: 'Angkor Guide', author: 'Chea Rithy', category: 'History', copies: 4),
    Book(id: '5', title: 'Modern Physics', author: 'A. Einstein', category: 'Science', copies: 2),
  ];

  static const members = [
    Member(id: '1', name: 'Sok', email: 'sok@email.com', borrowed: 3),
    Member(id: '2', name: 'Dara', email: 'dara@email.com', borrowed: 1),
    Member(id: '3', name: 'Sophea', email: 'sophea@email.com', borrowed: 2, status: MemberStatus.overdue),
    Member(id: '4', name: 'Rithy', email: 'rithy@email.com', status: MemberStatus.inactive),
  ];

  static final records = [
    BorrowRecord(bookTitle: 'History of Cambodia', memberName: 'Sok', borrowDate: DateTime(2026, 11, 1), dueDate: DateTime(2026, 11, 15), status: RecordStatus.borrowed),
    BorrowRecord(bookTitle: 'Khmer Folk Tales', memberName: 'Dara', borrowDate: DateTime(2026, 10, 20), dueDate: DateTime(2026, 11, 3), status: RecordStatus.overdue),
    BorrowRecord(bookTitle: 'Mekong Story', memberName: 'Sophea', borrowDate: DateTime(2026, 10, 5), dueDate: DateTime(2026, 10, 19), status: RecordStatus.returned),
    BorrowRecord(bookTitle: 'Angkor Guide', memberName: 'Sok', borrowDate: DateTime(2026, 11, 8), dueDate: DateTime(2026, 11, 22), status: RecordStatus.borrowed),
  ];
}
