import 'package:flutter/material.dart';
import 'package:num_library/core/constants/app_colors.dart';
import 'package:num_library/core/utils/date_formatter.dart';
import 'package:num_library/data/mock/mock_data.dart';
import 'package:num_library/data/models/borrow_record.dart';
import 'package:num_library/shared/widgets/status_badge.dart';

class BorrowHistoryScreen extends StatefulWidget {
  const BorrowHistoryScreen({super.key});

  @override
  State<BorrowHistoryScreen> createState() => _BorrowHistoryScreenState();
}

class _BorrowHistoryScreenState extends State<BorrowHistoryScreen> {
  RecordStatus? _filter;

  @override
  Widget build(BuildContext context) {
    final records = MockData.records.where((r) => _filter == null || r.status == _filter).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Borrow History', style: TextStyle(fontWeight: FontWeight.bold))),
      body: Column(
        children: [
          SizedBox(
            height: 52,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8).copyWith(left: 16),
              children: [
                _chip('All', null),
                _chip('Borrowed', RecordStatus.borrowed),
                _chip('Returned', RecordStatus.returned),
                _chip('Overdue', RecordStatus.overdue),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: records.length,
              itemBuilder: (_, i) {
                final r = records[i];
                final (label, type) = switch (r.status) {
                  RecordStatus.borrowed => ('Borrowed', BadgeType.warning),
                  RecordStatus.returned => ('Returned', BadgeType.success),
                  RecordStatus.overdue => ('Overdue', BadgeType.danger),
                };
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  child: Row(children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(r.bookTitle, style: const TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 2),
                        Text(r.memberName, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
                        Text('${formatDate(r.borrowDate)} → ${formatDate(r.dueDate)}',
                            style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
                      ]),
                    ),
                    StatusBadge(text: label, type: type),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, RecordStatus? value) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ChoiceChip(
          label: Text(label),
          selected: _filter == value,
          onSelected: (_) => setState(() => _filter = value),
        ),
      );
}
