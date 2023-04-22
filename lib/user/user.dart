class User {
  String name;
  String key;

  User({
    required this.name,
    required this.key,
  });

  setName(name) {
    this.name = name;
  }

  setKey(key) {
    this.key = key;
  }

  setUser(user) {
    name = user.name;
    key = user.key;
  }

  getName() {
    return name;
  }

  getKey() {
    return key;
  }

  getUser() {
    return this;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to User");
    }
    return User(
      name: json['name'],
      key: json['key'],
    );
  }

  @override
  String toString() {
    return 'name: $name, key: $key';
  }
}
