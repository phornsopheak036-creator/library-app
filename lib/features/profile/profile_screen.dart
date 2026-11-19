import 'package:flutter/material.dart';
import 'package:num_library/core/constants/app_colors.dart';
import 'package:num_library/core/routes/app_routes.dart';
import 'package:num_library/shared/widgets/stat_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: AppColors.navy, borderRadius: BorderRadius.circular(14)),
              child: const Row(children: [
                CircleAvatar(radius: 28, backgroundColor: AppColors.primary,
                    child: Text('S', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))),
                SizedBox(width: 14),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Sok', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('sok@readdaily.org', style: TextStyle(color: Colors.white70, fontSize: 13)),
                ]),
              ]),
            ),
            const SizedBox(height: 16),
            const Row(children: [
              Expanded(child: StatCard(value: '3', label: 'Borrowed')),
              SizedBox(width: 8),
              Expanded(child: StatCard(value: '1', label: 'Overdue', color: AppColors.danger, background: AppColors.dangerBg)),
              SizedBox(width: 8),
              Expanded(child: StatCard(value: '12', label: 'Returned', color: AppColors.success, background: AppColors.successBg)),
            ]),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Column(children: [
                ListTile(leading: Icon(Icons.person_outline), title: Text('Edit Profile'), trailing: Icon(Icons.chevron_right)),
                Divider(height: 1),
                ListTile(leading: Icon(Icons.notifications_none), title: Text('Notifications'), trailing: Icon(Icons.chevron_right)),
                Divider(height: 1),
                ListTile(leading: Icon(Icons.help_outline), title: Text('Help & Support'), trailing: Icon(Icons.chevron_right)),
              ]),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (_) => false),
                icon: const Icon(Icons.logout, color: AppColors.danger),
                label: const Text('Log out', style: TextStyle(color: AppColors.danger)),
                style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.danger)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
