class User {
  String name;
  String osztaly;

  User({
    required this.name,
    required this.osztaly,
  });

  setName(name) {
    this.name = name;
  }

  setClass(osztaly) {
    this.osztaly = osztaly;
  }

  getName() {
    return name;
  }

  getClass() {
    return osztaly;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to User");
    }
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
