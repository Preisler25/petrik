class Status {
  final bool status;
  final String authToken;

  const Status({
    required this.status,
    required this.authToken,
  });

  factory Status.fromJson(Map<dynamic, dynamic> json) {
    return Status(
      status: json['status'],
      authToken: json['auth_token'],
    );
  }
}
