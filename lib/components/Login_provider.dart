import 'package:car_rider/components/progress_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

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

  void registerOrLoginUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    context,
  }) async {
    if (!isLogin) {
      final isValidate = _formkey.currentState?.validate() ?? false;

      if (!isValidate) {
        return;
      }
      _formkey.currentState?.save();

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) =>
            ProgressDialog(status: "Criando sua conta."),
      );

      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        DatabaseReference newUserRef =
            FirebaseDatabase.instance.ref("users/${user.user!.uid}");
        Map userMap = {
          "name": name,
          "email": email,
          "phone": phone,
        };

        newUserRef.set(userMap);
      } else {
        return;
      }
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) =>
            ProgressDialog(status: "Entrando em sua conta."),
      );
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user != null) {
        DatabaseReference userRef =
            FirebaseDatabase.instance.ref("users/${user.user!.uid}");
      }
      Navigator.pop(context);
    }
    Navigator.of(context).restorablePushNamedAndRemoveUntil(
      AppRoutes.MAIN_PAGE,
      (route) => false,
    );
  }
}
