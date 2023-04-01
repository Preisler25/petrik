import 'package:petrik/user/user.dart';

User userProf = User(name: '', osztaly: '', key: '', fullname: '');

void setName(name) {
  userProf.setName(name);
}

void setFullname(fullname) {
  userProf.setFullname(fullname);
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

String getFullname() {
  return userProf.getFullname();
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
