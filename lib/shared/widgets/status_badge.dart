import 'package:flutter/material.dart';
import 'package:num_library/core/constants/app_colors.dart';

enum BadgeType { success, warning, danger, info }

class StatusBadge extends StatelessWidget {
  final String text;
  final BadgeType type;

  const StatusBadge({super.key, required this.text, required this.type});

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (type) {
      BadgeType.success => (AppColors.successBg, AppColors.success),
      BadgeType.warning => (AppColors.warningBg, AppColors.warning),
      BadgeType.danger => (AppColors.dangerBg, AppColors.danger),
      BadgeType.info => (AppColors.infoBg, AppColors.primary),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: fg)),
    );
  }
}
