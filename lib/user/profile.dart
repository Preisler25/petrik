import 'package:petrik/user/user.dart';

User userProf = User(name: '', key: '');

void setName(name) {
  userProf.setName(name);
}

void setKey(key) {
  userProf.setKey(key);
}

void setUser(user) {
  userProf.setUser(user);
}

String getName() {
  return userProf.getName();
}

String getKey() {
  return userProf.getKey();
}

User getUser() {
  return userProf.getUser();
}
