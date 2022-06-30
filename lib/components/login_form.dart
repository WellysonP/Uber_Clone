import 'package:car_rider/components/Login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brand_colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    bool isLogin = provider.isLogin;
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            if (!isLogin)
              const TextField(
                decoration: InputDecoration(
                  labelText: "Nome Completo",
                  labelStyle: TextStyle(
                    fontSize: 14,
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                style: TextStyle(fontSize: 14),
              ),
            if (!isLogin) const SizedBox(height: 10),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            if (!isLogin)
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Número de celular",
                  labelStyle: TextStyle(
                    fontSize: 14,
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                style: TextStyle(fontSize: 14),
              ),
            if (!isLogin) const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 40),
            TextButton(
              // ignore: sort_child_properties_last
              child: SizedBox(
                height: 35,
                child: Center(
                  child: Text(
                    isLogin == false ? "REGISTRAR" : "ENTRAR",
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Brand-Bold",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: BrandColors.colorGreen,
              ),
            ),
            TextButton(
              child: Text(
                !isLogin
                    ? "Já possui conta como Motorista? Clique aqui"
                    : "Não possui conto como Motorista? Clique aqui",
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Brand-Regular",
                ),
              ),
              onPressed: () => provider.changLogin(),
            ),
          ],
        ),
      ),
    );
  }
}
