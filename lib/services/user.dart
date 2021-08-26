import 'package:digi/services/secure_storage.dart';
final SecureStorage secureStorage = SecureStorage();

class User {
  String email;

  User({required this.email});

  static bool isLoggedIn() {
    secureStorage.readSecureData('token')
        .then((value) {
          if(value == null) {
            return false;
          }
    });

    return true;
  }
}