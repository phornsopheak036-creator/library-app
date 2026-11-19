import 'package:flutter/material.dart';
import 'package:num_library/core/constants/app_colors.dart';

class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final Color background;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    this.color = AppColors.primary,
    this.background = AppColors.infoBg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textDark)),
        ],
      ),
    );
  }
}
