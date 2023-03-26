import 'package:petrik/util/user.dart';

class Status {
  final bool status;
  final User? user;

  const Status({
    required this.status,
    this.user,
  });

  factory Status.fromJson(Map<dynamic, dynamic> json) {
    return Status(
      status: json['status'],
      user: User.fromJson(json['user']),
    );
  }
}
