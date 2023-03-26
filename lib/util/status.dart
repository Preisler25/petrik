class Status {
  final bool status;

  const Status({
    required this.status,
  });

  factory Status.fromJson(Map<dynamic, dynamic> json) {
    return Status(
      status: json['status'],
    );
  }
}
