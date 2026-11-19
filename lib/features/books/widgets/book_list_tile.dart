import 'package:flutter/material.dart';
import 'package:num_library/core/constants/app_colors.dart';
import 'package:num_library/data/models/book.dart';
import 'package:num_library/shared/widgets/status_badge.dart';

class BookListTile extends StatelessWidget {
  final Book book;
  final VoidCallback? onTap;
  const BookListTile({super.key, required this.book, this.onTap});

  @override
  Widget build(BuildContext context) {
    final (label, type) = switch (book.status) {
      BookStatus.available => ('Available', BadgeType.success),
      BookStatus.borrowed => ('Borrowed', BadgeType.warning),
      BookStatus.overdue => ('Overdue', BadgeType.danger),
    };
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Container(
            width: 44,
            height: 56,
            decoration: BoxDecoration(color: AppColors.navy, borderRadius: BorderRadius.circular(6)),
            child: const Icon(Icons.menu_book, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(book.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              const SizedBox(height: 2),
              Text(book.author, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
              const SizedBox(height: 6),
              StatusBadge(text: label, type: type),
            ]),
          ),
          const Icon(Icons.chevron_right, color: AppColors.hint),
        ]),
      ),
    );
  }
}
