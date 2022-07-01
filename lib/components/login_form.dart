import 'package:car_rider/components/Login_provider.dart';
import 'package:car_rider/components/validator.dart';
import 'package:car_rider/screens/main_page.dart';
import 'package:car_rider/utils/app_routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brand_colors.dart';

class LoginForm extends StatelessWidget {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailControler = TextEditingController();
  final passowordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    bool isLogin = provider.isLogin;
    return Form(
      key: provider.formkey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            if (!isLogin)
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Nome Completo",
                  labelStyle: TextStyle(
                    fontSize: 14,
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                style: const TextStyle(fontSize: 14),
                validator: (_name) {
                  final name = _name ?? "";
                  if (name.trim().isEmpty) {
                    return "Campo obrigatório";
                  }
                  if (name.trim().length < 5) {
                    return "Informar nome completo";
                  }
                  return null;
                },
              ),
            if (!isLogin) const SizedBox(height: 10),
            TextFormField(
              controller: emailControler,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              style: const TextStyle(fontSize: 14),
              validator: (_email) {
                final email = _email ?? "";
                if (email.isEmpty) {
                  return "Campo Obrigatório";
                }
                if (!emailValid(email)) {
                  return "Informar endereço de e-mail válido";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            if (!isLogin)
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Número de celular",
                  labelStyle: TextStyle(
                    fontSize: 14,
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                style: const TextStyle(fontSize: 14),
                validator: (_phone) {
                  final phone = _phone ?? "";
                  if (phone.isEmpty) {
                    return "Campo Obrigatório";
                  }
                  if (phone.trim().length < 11) {
                    return "Número inválido";
                  }
                  return null;
                },
              ),
            if (!isLogin) const SizedBox(height: 10),
            TextFormField(
              controller: passowordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  fontSize: 14,
                ),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              style: const TextStyle(fontSize: 14),
              validator: (_password) {
                final password = _password ?? "";
                if (password.isEmpty) {
                  return "Campo Obrigatório";
                }
                if (password.length < 8) {
                  return "Senha deve conter no mínimo 8 caracteres";
                }
                return null;
              },
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
              onPressed: () async {
                final msg = ScaffoldMessenger.of(context);

                final connectivityResult =
                    await Connectivity().checkConnectivity();

                if (connectivityResult != ConnectivityResult.mobile &&
                    connectivityResult != ConnectivityResult.wifi) {
                  msg.showSnackBar(
                      SnackBar(content: Text("Sem conexão com internet")));
                }
                provider.registerOrLoginUser(
                    name: nameController.text,
                    email: emailControler.text,
                    password: passowordController.text,
                    phone: phoneController.text,
                    context: context);
              },
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
