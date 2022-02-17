import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/routes.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pushNamed(context, MyRoutes.homeRoute);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Account Created"),
      content: const Text("Your Account is succesfully created"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String password = "";
  bool isPasswordVisible = false;
  bool agree = false;
  validateForm(BuildContext context) async {
    agree ? _doSomething : null;
  }

  moveToSignIn(BuildContext context) async {
    if (_formKey.currentState!.validate() && agree) {
      showAlertDialog(context);
    }
  }

  void _doSomething() {
    // Do something
  }

  String name = "";
  bool changeButton = false;
  bool _obscureText = true;

  get xFF2661FA => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            "assets/images/logo2.png",
            alignment: Alignment.center,
            fit: BoxFit.cover,
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
                const SizedBox(
                  height: 1.0,
                ),
                const Text(
                  "Welcome ",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Register Your Account",
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
                        decoration: const InputDecoration(
                            hintText: "ex. example@email.com",
                            labelText: "Company Name",
                            prefixIcon: Icon(Icons.business),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Company name cannot be empty";
                          }
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                            hintText: "ex. example@email.com",
                            labelText: "Email Id",
                            prefixIcon: Icon(Icons.mail),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email ID cannot be empty";
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                            hintText: "ex. 90********",
                            labelText: "Contact Number",
                            prefixIcon: Icon(Icons.contacts),
                            border: OutlineInputBorder()),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.lock),
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
                            border: const OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                        },
                        obscureText: _obscureText,
                        onChanged: (value) => password = value,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Confirm Password",
                            prefixIcon: const Icon(Icons.lock),
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
                            border: const OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          if (value != password) {
                            return 'Confimation password does not match';
                          }
                          return null;
                        },
                        obscureText: _obscureText,
                      ),
                      Row(
                        children: [
                          Material(
                            child: Checkbox(
                              value: agree,
                              onChanged: (value) {
                                setState(() {
                                  agree = value ?? false;
                                });
                              },
                            ),
                          ),
                          const Text(
                            'I have read and accept terms \nand conditions',
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                      ElevatedButton(
                          child: const Text("Continue"),
                          style: TextButton.styleFrom(
                              minimumSize: const Size(300, 40)),
                          onPressed: () {
                            validateForm(context);
                            moveToSignIn(context);
                          }
                          // agree ? _doSomething : null
                          ),

                      const SizedBox(
                        height: 1.0,
                      ),

                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },

                          child: const Text(
                            "Already Have an Account? Sign In",

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
}
