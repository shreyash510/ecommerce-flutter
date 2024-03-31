import 'package:ecommerce/common/secureStorage.dart';
import "package:ecommerce/screens/login/login.dart";

import 'package:flutter/material.dart';

void main() {
  runApp(ThemeColor());
}

class ThemeColor extends StatefulWidget {
  ThemeColor({Key? key}) : super(key: key);
  SecureStorageHelper secureStorage = SecureStorageHelper();

  @override
  State<ThemeColor> createState() => _ThemeColorState();
}

class _ThemeColorState extends State<ThemeColor> {
  SecureStorageHelper secureStorege = SecureStorageHelper();
  bool isDark = false;
  @override
  void initState() {
    super.initState();
    // Call getThemeState when the state is initialized
    getThemeState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          primary: Colors.purple,
          brightness: isDark ? Brightness.dark : Brightness.light,
        ),
      ),
      home: LoginScreen(),
    );
  }

  Future<void> getThemeState() async {
    var data = await secureStorege.readItem("isDark");
    var result = data == "true";
    print("data11 : $result");
    setState(() {
      // Update isDark based on the fetched data
      // For example, if data indicates dark theme, set isDark to true
      isDark = data == "true"; // Update this according to your logic
    });
  }

  @override
  void didUpdateWidget(covariant ThemeColor oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('it run didUpdateWidget');
    // Call getThemeState whenever the widget is updated
    getThemeState();
  }
}
