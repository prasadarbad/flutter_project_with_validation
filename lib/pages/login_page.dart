import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
             // ignore: prefer_const_constructors
             SizedBox(
              height: 20.0,
             ),
            // ignore: prefer_const_constructors
            Text(
              "Welcome",
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
             const SizedBox(
              height: 20.0,
              ),
              Padding
              (padding:
               const EdgeInsets.symmetric(vertical:16.0,horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Username",
                  labelText: "username",
                ),
              ),
               TextFormField(
                 obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password",
                ),
              ),
               // ignore: prefer_const_constructors
               SizedBox(
              height: 20.0,
              ),
              ElevatedButton(
                child:Text("Login"),
                style: TextButton.styleFrom(),
                onPressed: () {
                  print("Hello diplomachakhazana");
                },
                )
              ],
               
               // ignore: prefer_const_constructors
              
              ),
              )
          ],
        ));
  }
}
