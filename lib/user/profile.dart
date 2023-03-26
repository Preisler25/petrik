import 'package:petrik/util/user.dart';

User userProf = User(name: '', osztaly: '');

void setName(name) {
  userProf.setName(name);
}

void setClass(osztaly) {
  userProf.setClass(osztaly);
}

String getName() {
  return userProf.getName();
}

String getClass() {
  return userProf.getClass();
}
