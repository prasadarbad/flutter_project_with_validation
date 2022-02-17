// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/main.dart';
// ignore: unused_import
import 'package:flutter_application_1/utils/routes.dart';

import 'login_page.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("OTP SENT!"),
      content: Text("OTP is sent to your mail ID."),
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

  final _formKey = GlobalKey<FormState>();
  String password = "";
  bool isPasswordVisible = false;
  moveToSignIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      showAlertDialog(context);
    }
  }

  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                  "assets/images/forget_pass.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Forget Password!",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please enter your email for OTP verification",
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
                      SizedBox(
                        height: 1.0,
                      ),
                      ElevatedButton(
                        child: const Text("Send Otp"),
                        style: TextButton.styleFrom(
                            minimumSize: const Size(300, 40)),
                        onPressed: () {
                          moveToSignIn(context);
                        },
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
                                    builder: (context) => LoginPage()));
                          },

                          child: Text(
                            "Already Have an Account? Sign In",

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ), // TextStyle
                          ), // Text
                        ), // GestureDetector
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
