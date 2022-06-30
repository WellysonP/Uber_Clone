import 'package:car_rider/screens/login_page.dart';
import 'package:car_rider/screens/registration_page.dart';
import 'package:car_rider/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Brand-Regular",
        primarySwatch: Colors.blue,
      ),
      // home: const RegistrationPage(),
      routes: {
        AppRoutes.LOGIN_PAGE: (context) => const LoginPage(),
        AppRoutes.REGISTRATION_PAGE: (context) => const RegistrationPage(),
      },
    );
  }
}
