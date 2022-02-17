import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/controller/login_controller.dart';
import 'package:flutter_application_1/provider/theme_provider.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/forgetpass.dart';
import 'pages/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider notifier, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => LoginController(),
            )
          ],
          child: GetMaterialApp(
            home: FutureBuilder(
              future: authController.tryAutoLogin(),
              builder: (contect, authResult) {
                if (authResult.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red));
                } else {
                  if (authResult.data == true) {
                    return const HomePage();
                  }
                  return const LoginPage();
                }
              },
            ),
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryTextTheme: GoogleFonts.latoTextTheme()),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            routes: {
              "/": (context) => const LoginPage(),
              MyRoutes.homeRoute: (context) => const HomePage(),
              MyRoutes.loginRoute: (context) => const LoginPage(),
              MyRoutes.forgetRoute: (context) => const ForgetPass(),
              MyRoutes.signupRoute: (context) => const SignUp(),
            },
          ),
        );
      }),
    );
  }
}
