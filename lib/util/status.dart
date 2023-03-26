import 'package:petrik/util/user.dart';

class Status {
  final bool status;
  final String auth;
  final User user;

  const Status({
    required this.status,
    required this.auth,
    required this.user,
  });

  factory Status.fromJson(Map<dynamic, dynamic> json) {
    return Status(
      auth: json['auth'],
      status: json['status'],
      user: User.fromJson(json['user']),
    );
  }
}
