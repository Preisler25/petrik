import 'package:petrik/util/user.dart';

class ServerValidation {
  final bool status;
  final User user;

  const ServerValidation({
    required this.status,
    required this.user,
  });

  factory ServerValidation.fromJson(Map<dynamic, dynamic> json) {
    return ServerValidation(
      status: json['status'],
      user: User.fromJson(json['user']),
    );
  }
}
