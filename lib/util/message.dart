class Message {
  final bool status;
  final String message;

  const Message({
    required this.status,
    required this.message,
  });

  factory Message.fromJson(Map<dynamic, dynamic> json) {
    return Message(
      status: json['status'],
      message: json['message'],
    );
  }
}
