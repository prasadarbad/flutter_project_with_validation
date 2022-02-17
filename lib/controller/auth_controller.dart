// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static login(Map userData) async {
    print(userData);
    var response = {"user_id": "99", "user_token": "xx8894jjdsdhsuur"};
    var any = await SharedPreferences.getInstance();

    any.setString("userData", json.encode(response));

    Get.off(() => const HomePage());
  }

  Future<bool> tryAutoLogin() async {
    var any = await SharedPreferences.getInstance();
    if (!any.containsKey("userData")) {
      return false;
    } else {
      return true;
    }
  }

  static logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.off(() => const LoginPage());
  }
}
