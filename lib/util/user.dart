class User {
  final String name;
  final String password;
  final String osztaly;
  String auth;

  User({
    required this.name,
    required this.password,
    required this.osztaly,
    this.auth = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      password: json['password'],
      osztaly: json['osztaly'],
    );
  }

  @override
  String toString() {
    return 'name: $name, password: $password';
  }
}
