class AppConstants {
  //static const String Base_URL = 'https://helyettesites.petrik.hu/'; //pord
  //static const String Base_URL = 'http://192.168.1.199:80'; //Preisler
  static const String Base_URL = 'http://192.168.1.114:80'; //preisle mac
  //static const String Base_URL = 'http://192.168.100.14:80'; //Mate
  //static const String Base_URL = 'https://helyettesistes.petrik.hu/'; //pord
  static const String API_URL = '$Base_URL/api';
  static const String API_LOGIN = '$API_URL/login';
  static const String API_IKSZ =
      'https://helyettesites.petrik.hu/api/index.php?status=ikszOpp';
  static const String API_REG = '$API_URL/reg';
  static const String API_JOIN = '$API_URL/join_iksz';
  static const String API_HELYETTESITES = '$API_URL/?status=napihely';
}
