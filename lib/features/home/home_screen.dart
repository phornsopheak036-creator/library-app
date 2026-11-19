import 'package:flutter/material.dart';
import 'package:num_library/core/constants/app_colors.dart';
import 'package:num_library/core/routes/app_routes.dart';
import 'package:num_library/core/utils/date_formatter.dart';
import 'package:num_library/data/mock/mock_data.dart';
import 'package:num_library/data/models/borrow_record.dart';
import 'package:num_library/shared/widgets/stat_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final records = MockData.records;
    final borrowed = records.where((r) => r.status == RecordStatus.borrowed).length;
    final overdue = records.where((r) => r.status == RecordStatus.overdue).length;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good morning, Sok',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.navy)),
                      SizedBox(height: 2),
                      Text('Librarian', style: TextStyle(fontSize: 13, color: AppColors.textGrey)),
                    ],
                  ),
                ),
                CircleAvatar(backgroundColor: AppColors.primary, child: Text('S', style: TextStyle(color: Colors.white))),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Overview', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.navy)),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: StatCard(value: '${MockData.books.length * 50 - 2}', label: 'Total Books')),
              const SizedBox(width: 10),
              Expanded(child: StatCard(value: '${MockData.members.length}', label: 'Members',
                  color: AppColors.success, background: AppColors.successBg)),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: StatCard(value: '$borrowed', label: 'Borrowed',
                  color: AppColors.warning, background: AppColors.warningBg)),
              const SizedBox(width: 10),
              Expanded(child: StatCard(value: '$overdue', label: 'Overdue',
                  color: AppColors.danger, background: AppColors.dangerBg)),
            ]),
            const SizedBox(height: 18),
            Row(children: [
              Expanded(child: _Action(icon: Icons.add, label: 'Add Book', onTap: () => Navigator.pushNamed(context, AppRoutes.addBook))),
              const SizedBox(width: 10),
              Expanded(child: _Action(icon: Icons.history, label: 'History', onTap: () => Navigator.pushNamed(context, AppRoutes.borrowHistory))),
            ]),
            const SizedBox(height: 22),
            const Text('Recent Activity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.navy)),
            const SizedBox(height: 10),
            for (final r in records)
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Row(children: [
                  const Icon(Icons.menu_book, color: AppColors.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(r.bookTitle, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                      Text('${r.memberName} • ${formatDate(r.borrowDate)}',
                          style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
                    ]),
                  ),
                ]),
              ),
          ],
        ),
      ),
    );
  }
}

class _Action extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _Action({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ]),
      ),
    );
  }
}
