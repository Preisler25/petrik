bool isValidFullName(String fullName) {
  RegExp regex = RegExp(
      r'^[A-Z][a-z]*(\s[A-Z][a-z]*)+$'); // csak betuk es space, elsok nagybetuk
  return regex.hasMatch(fullName);
}

bool isValidUsername(String username) {
  final regex = RegExp(r'^[a-zA-Z][\w]{3,19}$');
  //A felhasználónévnek betűvel kell kezdődnie, és csak alfanumerikus karaktereket és aláhúzás jelet tartalmazhat. 4 és 20 karakter közötti hosszúnak kell lennie.
  return regex.hasMatch(username);
}
