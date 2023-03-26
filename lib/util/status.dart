class Status {
  final bool status;
  final String auth_token;

  const Status({
    required this.status,
    required this.auth_token,
  });

  factory Status.fromJson(Map<dynamic, dynamic> json) {
    return Status(
      status: json['status'],
      auth_token: json['auth_token'],
    );
  }
}
