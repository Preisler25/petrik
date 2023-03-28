import 'package:petrik/util/user.dart';

User userProf = User(name: '', osztaly: '', key: '');

void setName(name) {
  userProf.setName(name);
}

void setClass(osztaly) {
  userProf.setClass(osztaly);
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

String getClass() {
  return userProf.getClass();
}

String getKey() {
  return userProf.getKey();
}

User getUser() {
  return userProf.getUser();
}
