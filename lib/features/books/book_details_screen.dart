import 'package:flutter/material.dart';
import 'package:num_library/core/constants/app_colors.dart';
import 'package:num_library/data/models/book.dart';
import 'package:num_library/shared/widgets/primary_button.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)?.settings.arguments as Book?;
    if (book == null) {
      return Scaffold(appBar: AppBar(), body: const Center(child: Text('Book not found')));
    }
    final available = book.status == BookStatus.available;

    return Scaffold(
      appBar: AppBar(title: const Text('Book Details', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: AppColors.navy, borderRadius: BorderRadius.circular(14)),
            child: Row(children: [
              Container(
                width: 70,
                height: 94,
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.menu_book, color: Colors.white, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(book.title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(book.author, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                ]),
              ),
            ]),
          ),
          const SizedBox(height: 20),
          const Text('Book Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.navy)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(children: [
              _Row('Category', book.category),
              _Row('ISBN', book.isbn),
              _Row('Copies', '${book.copies}'),
              _Row('Status', book.status.name[0].toUpperCase() + book.status.name.substring(1)),
            ]),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: available ? 'Borrow this book' : 'Currently unavailable',
            icon: Icons.swap_horiz,
            onPressed: available
                ? () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Go to the Borrow tab to complete')));
                  }
                : null,
          ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  const _Row(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: const TextStyle(color: AppColors.textGrey, fontSize: 13)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
      ]),
    );
  }
}
