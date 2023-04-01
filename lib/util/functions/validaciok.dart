bool isValidFullName(String fullName) {
  RegExp regex = RegExp(
      r'^[A-Z][a-z]*(\s[A-Z][a-z]*)+$'); // csak betuk es space, elsok nagybetuk
  return regex.hasMatch(fullName);
}
