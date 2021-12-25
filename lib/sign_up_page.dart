import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_login_page/design.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(body: Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 10.0,
            left: 30.0,
            right: 30.0,
            child: SvgPicture.asset(
              "assets/icons/signup.svg",
              width: size.width * 0.43,
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Image.asset("assets/images/signup_top.png"),
            width: size.width * 0.3,
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Image.asset("assets/images/main_bottom.png"),
            width: size.width * 0.25,
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Image.asset("assets/images/login_bottom.png"),
            width: size.width * 0.3,
          ),
          /////////////////////////////////////
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const SizedBox(height: 89.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0,vertical: 5.0),
                child: TextFormField(
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.deepPurple,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.deepPurple)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0,vertical: 5.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      labelText: "E-Mail",
                      labelStyle: TextStyle(color: Colors.deepPurple)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0,vertical: 5.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration:  const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.deepPurple)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a member?"),
                  TextButton(child:Text("Log In"),onPressed: (){
                    Navigator.pop(context);
                  },)
                ],
              ),
              Container(
                width: 150.0,
                child: ElevatedButton(
                  child: Text("Sign Up"),
                  onPressed: () {
                    createUserWithEmailPS(email: _emailController.text, password: _passwordController.text, context: context);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5.0),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.deepPurpleAccent),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.0),
                              side: BorderSide(color: Colors.deepPurple)))),
                ),
              ),
            ],

          )
        ],
      ),
    )

    );
  }
}
Future<User?> createUserWithEmailPS({required String email, required String password, required BuildContext context}) async{
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  try{
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    user = userCredential.user;
  } on FirebaseAuthException catch (e){
    if(e.code == "user-not-fount"){
      print("Error");
    }
  }
  return user;
}
