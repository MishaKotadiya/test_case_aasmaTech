import 'package:flutter/material.dart';
import 'package:kwikshop/feature/Authentication/presentation/screens/login_screen.dart';
import '../../../../core/shared/appButton.dart';
import '../../../../core/shared/app_string.dart';
import '../widgets/screenBackground.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const ScreenBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppString.welcomeTitle,
                  textAlign: TextAlign.center,
                  style: textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  AppString.welcomeDesc,
                  textAlign: TextAlign.center,
                  style: textTheme.labelLarge!.copyWith(
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 30),
                AppButton(
                  title: AppString.getStarted,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
