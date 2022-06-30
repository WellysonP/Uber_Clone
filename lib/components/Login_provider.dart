import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  bool _isLogin = true;
  bool get isLogin => _isLogin;

  void changLogin() {
    _isLogin = !_isLogin;
    notifyListeners();
  }
}
