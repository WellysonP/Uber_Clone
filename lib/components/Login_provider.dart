import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool _isLogin = true;
  bool get isLogin => _isLogin;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  GlobalKey<FormState> get formkey => _formkey;

  void changLogin() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  void registerUser(String email, String password) async {
    final isValidate = _formkey.currentState?.validate() ?? false;

    if (!isValidate) {
      return;
    }
    _formkey.currentState?.save();

    final user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
