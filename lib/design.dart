import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_login_page/ilker.dart';
import 'package:my_login_page/sign_up_page.dart';

class DesignedHomeScreen extends StatefulWidget {
  const DesignedHomeScreen({Key? key}) : super(key: key);

  @override
  _DesignedHomeScreenState createState() => _DesignedHomeScreenState();
}

class _DesignedHomeScreenState extends State<DesignedHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late String userName = "";
    late String password = "";
    bool isUsernameClicked = false;
    bool obsecureText = true;
    final _formKey = GlobalKey<FormState>();


    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30.0,
            left: 30.0,
            right: 30.0,
            child: SvgPicture.asset(
              "assets/icons/login.svg",
              width: size.width * 0.6,
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Image.asset("assets/images/main_top.png"),
            width: size.width * 0.3,
          ),
          Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: size.width * 0.3,
              )),
          Positioned(
              right: 0.0,
              bottom: 0.0,
              child: Image.asset(
                "assets/images/login_bottom.png",
                width: size.width * 0.4,
              )),
          Form(
            key: _formKey,
            child: Container(
              height: size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: isUsernameClicked
                              ? Colors.deepPurpleAccent
                              : Colors.white,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                          labelText: "E-mail",
                          labelStyle: TextStyle(color: Colors.deepPurple)),
                      validator: (input) {
                        if (input!.isEmpty) {
                          return "Please enter the username!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        userName = value!;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: obsecureText,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: () {
                                obsecureText = !obsecureText;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.visibility,
                                color: Colors.deepPurpleAccent,
                              )),
                          filled: true,
                          fillColor: isUsernameClicked
                              ? Colors.deepPurpleAccent
                              : Colors.white,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.deepPurple,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.deepPurple)),
                      validator: (input) {
                        if (input!.isEmpty) {
                          return "Please enter the password!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 250.0,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5.0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepPurpleAccent),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17.0),
                                    side:
                                        BorderSide(color: Colors.deepPurple)))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            print("Username: $userName, password:$password");
                          }
                          User? user = await loginUsingEmailPassword(email: _usernameController.text, password: _passwordController.text, context: context);
                          print(user);
                          if(user != null){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Deneme()));
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: 15.0),
                        )),
                  ),
                  Container(
                    width: 150.0,
                    child: ElevatedButton(
                      child: Text("Sign Up"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
FirebaseAuth auth = FirebaseAuth.instance;
User? user;
try{
  UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
  user = userCredential.user;
} on FirebaseAuthException catch (e){
  if(e.code == "user-not-fount"){
    print("no user found with this e-mail");
  }
}
return user;
}