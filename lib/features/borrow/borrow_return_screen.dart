import 'package:flutter/material.dart';
import 'package:num_library/core/constants/app_colors.dart';
import 'package:num_library/core/routes/app_routes.dart';
import 'package:num_library/core/utils/date_formatter.dart';
import 'package:num_library/data/mock/mock_data.dart';
import 'package:num_library/data/models/book.dart';
import 'package:num_library/data/models/borrow_record.dart';
import 'package:num_library/shared/widgets/primary_button.dart';

class BorrowReturnScreen extends StatefulWidget {
  const BorrowReturnScreen({super.key});

  @override
  State<BorrowReturnScreen> createState() => _BorrowReturnScreenState();
}

class _BorrowReturnScreenState extends State<BorrowReturnScreen> {
  int _tab = 0;
  String? _member;
  String? _book;
  final DateTime _due = DateTime.now().add(const Duration(days: 14));

  void _confirmBorrow() {
    if (_member == null || _book == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Select a member and a book')));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$_book borrowed by $_member')));
    setState(() {
      _member = null;
      _book = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Borrow / Return', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.borrowHistory),
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 0, label: Text('Borrow Book'), icon: Icon(Icons.arrow_upward)),
              ButtonSegment(value: 1, label: Text('Return Book'), icon: Icon(Icons.arrow_downward)),
            ],
            selected: {_tab},
            onSelectionChanged: (s) => setState(() => _tab = s.first),
          ),
          const SizedBox(height: 20),
          if (_tab == 0) ..._borrowForm() else ..._returnList(),
        ],
      ),
    );
  }

  List<Widget> _borrowForm() {
    final available = MockData.books.where((b) => b.status == BookStatus.available).toList();
    return [
      const Text('Member', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      const SizedBox(height: 6),
      DropdownButtonFormField<String>(
        value: _member,
        hint: const Text('Select member'),
        items: [for (final m in MockData.members) DropdownMenuItem(value: m.name, child: Text(m.name))],
        onChanged: (v) => setState(() => _member = v),
        decoration: const InputDecoration(border: OutlineInputBorder(), filled: true, fillColor: Colors.white),
      ),
      const SizedBox(height: 14),
      const Text('Book', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      const SizedBox(height: 6),
      DropdownButtonFormField<String>(
        value: _book,
        hint: const Text('Select available book'),
        items: [for (final b in available) DropdownMenuItem(value: b.title, child: Text(b.title))],
        onChanged: (v) => setState(() => _book = v),
        decoration: const InputDecoration(border: OutlineInputBorder(), filled: true, fillColor: Colors.white),
      ),
      const SizedBox(height: 16),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: AppColors.infoBg, borderRadius: BorderRadius.circular(12)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Due date', style: TextStyle(color: AppColors.textDark)),
          Text(formatDate(_due), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
        ]),
      ),
      const SizedBox(height: 24),
      PrimaryButton(text: 'Confirm Borrow', icon: Icons.check, onPressed: _confirmBorrow),
    ];
  }

  List<Widget> _returnList() {
    final active = MockData.records.where((r) => r.status != RecordStatus.returned).toList();
    if (active.isEmpty) {
      return [const Center(child: Text('Nothing to return'))];
    }
    return [
      for (final r in active)
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Row(children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(r.bookTitle, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text('${r.memberName} • due ${formatDate(r.dueDate)}',
                    style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
              ]),
            ),
            TextButton(
              onPressed: () => ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('${r.bookTitle} returned'))),
              child: const Text('Return'),
            ),
          ]),
        ),
    ];
  }
}
