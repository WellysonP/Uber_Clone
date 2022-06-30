// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/Login_provider.dart';
import '../components/login_form.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    bool isLogin = provider.isLogin;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                Image.asset(
                  "assets/images/logo.png",
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 40),
                Text(
                  !isLogin
                      ? "Registrar como Motorista"
                      : "Login como Motorista",
                  style: TextStyle(fontSize: 25, fontFamily: "Brand-Bold"),
                ),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
