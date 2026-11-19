import 'package:flutter/material.dart';
import 'package:num_library/core/constants/app_colors.dart';
import 'package:num_library/data/mock/mock_data.dart';
import 'package:num_library/data/models/member.dart';
import 'package:num_library/shared/widgets/stat_card.dart';
import 'package:num_library/shared/widgets/status_badge.dart';

class MembersListScreen extends StatefulWidget {
  const MembersListScreen({super.key});

  @override
  State<MembersListScreen> createState() => _MembersListScreenState();
}

class _MembersListScreenState extends State<MembersListScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final all = MockData.members;
    final members = all.where((m) => m.name.toLowerCase().contains(_query.toLowerCase())).toList();
    int count(MemberStatus s) => all.where((m) => m.status == s).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Members List', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(children: [
            Expanded(child: StatCard(value: '${all.length}', label: 'Total')),
            const SizedBox(width: 8),
            Expanded(child: StatCard(value: '${count(MemberStatus.active)}', label: 'Active',
                color: AppColors.success, background: AppColors.successBg)),
            const SizedBox(width: 8),
            Expanded(child: StatCard(value: '${count(MemberStatus.overdue)}', label: 'Overdue',
                color: AppColors.danger, background: AppColors.dangerBg)),
          ]),
          const SizedBox(height: 14),
          TextField(
            onChanged: (v) => setState(() => _query = v),
            decoration: InputDecoration(
              hintText: 'Search members',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.border)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.border)),
            ),
          ),
          const SizedBox(height: 14),
          for (final m in members) _MemberTile(member: m),
        ],
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  final Member member;
  const _MemberTile({required this.member});

  @override
  Widget build(BuildContext context) {
    final (label, type) = switch (member.status) {
      MemberStatus.active => ('Active', BadgeType.success),
      MemberStatus.overdue => ('Overdue', BadgeType.danger),
      MemberStatus.inactive => ('Inactive', BadgeType.info),
    };
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        CircleAvatar(
          backgroundColor: AppColors.infoBg,
          child: Text(member.name[0], style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(member.name, style: const TextStyle(fontWeight: FontWeight.w600)),
            Text('${member.email} • ${member.borrowed} borrowed',
                style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
          ]),
        ),
        StatusBadge(text: label, type: type),
      ]),
    );
  }
}
