class User {
  String name;
  String fullname;
  String osztaly;
  String key;

  User({
    required this.name,
    required this.fullname,
    required this.osztaly,
    required this.key,
  });

  setName(name) {
    this.name = name;
  }

  setFullname(fullname) {
    this.fullname = fullname;
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

  getFullname() {
    return fullname;
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
      fullname: json['fullname'],
    );
  }

  @override
  String toString() {
    return 'name: $name, osztaly: $osztaly, key: $key fullname: $fullname';
  }
}
