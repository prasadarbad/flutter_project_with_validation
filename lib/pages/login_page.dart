// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/controller/login_controller.dart';

import 'package:flutter_application_1/pages/signup.dart';

import 'package:flutter_application_1/utils/routes.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _loginUserData = {
    'email': '',
    'password': '',
  };

  bool isPasswordVisible = false;
  bool _obscureText = true;

  String name = "";
  bool changeButton = false;

  get xFF2661FA => null;
  moveToHome() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    //Navigator.pushNamed(context, MyRoutes.homeRoute);
    _formKey.currentState!.save();
    // ignore: avoid_print
    print(_loginUserData);
    AuthController.login(_loginUserData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            "assets/images/logo2.png",
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/back3.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 0.40,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please sign in into your account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                            hintText: "Enter Email",
                            labelText: "Email",
                            prefixIcon: Icon(Icons.mail),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                        },
                        onSaved: (value) {
                          _loginUserData['email'] = value!;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "password length must be 6 character";
                          } else {
                            return null;
                          }
                        },
                        obscureText: _obscureText,
                        onSaved: (value) {
                          _loginUserData['password'] = value!;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 32.0),
                        child: TextButton(
                          child: const Text("Forget Password"),
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.forgetRoute);
                          },
                        ),
                      ),

                      SizedBox(
                        height: 1.0,
                      ),

                      ElevatedButton(
                          child: const Text(
                            "Login",
                          ),
                          style: TextButton.styleFrom(
                              minimumSize: const Size(300, 40)),
                          onPressed: () => moveToHome()),

                      Container(
                        child: loginUI(),
                      ),

                      Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },

                          child: Text(
                            "Don't Have an Account? Sign up",

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ), // TextStyle
                          ), // Text
                        ), // GestureDetector
                      ) // Container
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  loginUI() {
    return Consumer<LoginController>(builder: (context, model, child) {
      if (model.userDetails != null) {
        return Center(
          child: loggedinUI(model),
        );
      } else {
        return loginControllers(context);
      }
    });
  }

  loggedinUI(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.userDetails!.photoURL ?? "").image,
          radius: 50,
        ),
        Text(model.userDetails!.displayName ?? ""),
        Text(model.userDetails!.email ?? ""),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text("Logout"),
          onPressed: () {
            Provider.of<LoginController>(context, listen: false).logout();
          },
        )
      ],
    );
  }

  loginControllers(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset(
              "assets/images/google.png",
              width: 240,
            ),
            onTap: () {
              Provider.of<LoginController>(context, listen: false)
                  .googleLogin();
            },
          ),
        ],
      ),
    );
  }
}
