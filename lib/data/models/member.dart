enum MemberStatus { active, overdue, inactive }

class Member {
  final String id;
  final String name;
  final String email;
  final int borrowed;
  final MemberStatus status;

  const Member({
    required this.id,
    required this.name,
    required this.email,
    this.borrowed = 0,
    this.status = MemberStatus.active,
  });
}
