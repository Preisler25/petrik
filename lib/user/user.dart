class User {
  String name;
  String osztaly;
  String key;

  User({
    required this.name,
    required this.osztaly,
    required this.key,
  });

  setName(name) {
    this.name = name;
  }

  setClass(osztaly) {
    this.osztaly = osztaly;
  }

  setKey(key) {
    this.key = key;
  }

  setUser(user) {
    name = user.name;
    osztaly = user.osztaly;
    key = user.key;
  }

  getName() {
    return name;
  }

  getClass() {
    return osztaly;
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
      osztaly: json['osztaly'],
      key: json['key'],
    );
  }

  @override
  String toString() {
    return 'name: $name, osztaly: $osztaly, key: $key';
  }
}
