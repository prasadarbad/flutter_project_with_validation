import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/controller/login_controller.dart';
import 'package:flutter_application_1/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            "assets/images/logo2.png",
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
          actions: const [
            ChangeThemeButtonWidget(),
          ],
        ),
        body: Center(
          child: ElevatedButton(
              child: const Text(
                "Log Out",
              ),
              style: TextButton.styleFrom(minimumSize: const Size(150, 40)),
              onPressed: () => AuthController.logOut()),
        ),
        drawer: const Drawer(),
      ),
    );
  }
}

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Column(
      children: [
        Consumer<ThemeProvider>(
          builder: (context, notifier, child) => SwitchListTile(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              notifier.toggleTheme(value);
            },
          ),
        ),
      ],
    );

    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
        });
  }
}
