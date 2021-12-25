import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseAuth extends StatefulWidget {
  const FirebaseAuth({Key? key}) : super(key: key);

  @override
  _FirebaseAuthState createState() => _FirebaseAuthState();
}

class _FirebaseAuthState extends State<FirebaseAuth> {

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
