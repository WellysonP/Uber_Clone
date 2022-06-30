import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page")),
      body: Center(
        child: MaterialButton(
          height: 50,
          minWidth: 300,
          color: Colors.green,
          child: Text("Test Connection"),
          onPressed: () {
            DatabaseReference dbRef = FirebaseDatabase.instance.ref("test");
            dbRef.set("Test Connection");
          },
        ),
      ),
    );
  }
}
