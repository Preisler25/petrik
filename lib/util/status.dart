class Status {
  final bool status;
  final String auth;

  const Status({
    required this.status,
    required this.auth,
  });

  factory Status.fromJson(Map<dynamic, dynamic> json) {
    return Status(
      auth: json['auth'],
      status: json['status'],
    );
  }
}
