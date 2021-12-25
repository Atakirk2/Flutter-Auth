import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Deneme extends StatefulWidget {
  const Deneme({Key? key}) : super(key: key);

  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Succesfully Logged In",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          )),
          ElevatedButton(onPressed: () async {
            await auth.signOut();
            Navigator.pop(context);
          }, child: Text("Sign out!"))
        ],
      ),
    );
  }
}
