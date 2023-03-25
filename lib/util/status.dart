import 'dart:ffi';

class Status {
  final String status;

  const Status({
    required this.status,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      status: json['status'],
    );
  }
}
