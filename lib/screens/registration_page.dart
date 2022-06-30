// ignore_for_file: prefer_const_constructors

import 'package:car_rider/components/brand_colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const Text(
                  "Criar conta como Motorista",
                  style: TextStyle(fontSize: 25, fontFamily: "Brand-Bold"),
                ),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Nome Completo",
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Número de celular",
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 40),
                        TextButton(
                          // ignore: sort_child_properties_last
                          child: SizedBox(
                            height: 35,
                            child: Center(
                              child: Text(
                                "REGISTRAR",
                                style: TextStyle(
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
                            "Já possui conta como Motorista? Clique aqui",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Brand-Regular"),
                          ),
                          onPressed: () {
                            // Navigator.of(context).pop();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.LOGIN_PAGE, (route) => false);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
