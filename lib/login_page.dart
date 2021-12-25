import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String userName = "";
  late String password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            height: size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                        ),
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.deepPurple)),
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Please enter the Username!";
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
                    decoration: InputDecoration(
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
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print("Username: $userName, password:$password");
                        if (password != "a" && userName != "a") {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error has occured!"),
                                  content: Text(
                                      "Your username or password is wrong!"),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Continue"))
                                  ],
                                );
                              });
                        }
                      }
                    },
                    child: Text("Sign in")),
              ],
            ),
          ),
        ));
  }
}
