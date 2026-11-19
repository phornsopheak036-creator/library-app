import 'package:flutter/material.dart';
import 'package:num_library/core/constants/app_colors.dart';
import 'package:num_library/core/routes/app_routes.dart';
import 'package:num_library/data/mock/mock_data.dart';
import 'package:num_library/data/models/book.dart';
import 'package:num_library/features/books/widgets/book_list_tile.dart';

class BookCatalogScreen extends StatefulWidget {
  const BookCatalogScreen({super.key});

  @override
  State<BookCatalogScreen> createState() => _BookCatalogScreenState();
}

class _BookCatalogScreenState extends State<BookCatalogScreen> {
  String _category = 'All';
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final List<Book> books = MockData.books.where((b) {
      final catOk = _category == 'All' || b.category == _category;
      final q = _query.toLowerCase();
      final qOk = q.isEmpty || b.title.toLowerCase().contains(q) || b.author.toLowerCase().contains(q);
      return catOk && qOk;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Catalog', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.addBook),
            icon: const Icon(Icons.add_circle, color: AppColors.primary),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                hintText: 'Search title or author',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 42,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                for (final c in MockData.categories)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(c),
                      selected: _category == c,
                      onSelected: (_) => setState(() => _category = c),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: books.isEmpty
                ? const Center(child: Text('No books found', style: TextStyle(color: AppColors.textGrey)))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: books.length,
                    itemBuilder: (_, i) => BookListTile(
                      book: books[i],
                      onTap: () => Navigator.pushNamed(context, AppRoutes.bookDetails, arguments: books[i]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
