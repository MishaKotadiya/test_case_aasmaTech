import 'package:flutter/material.dart';
import 'package:kwikshop/config/theme/app_theme.dart';
import 'package:kwikshop/core/shared/app_string.dart';
import 'package:kwikshop/feature/Welcome/presentation/screens/welcome_screen.dart';
import 'feature/Home/Presentation/screens/home_screen.dart';

Future<void> main() async {
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: MyTheme.darkTheme(context),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
