class User {
  final String name;
  final String osztaly;

  User({
    required this.name,
    required this.osztaly,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      osztaly: json['osztaly'],
    );
  }

  @override
  String toString() {
    return 'name: $name, osztaly: $osztaly';
  }
}
