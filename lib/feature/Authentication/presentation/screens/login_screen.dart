import 'package:flutter/material.dart';
import 'package:kwikshop/feature/Authentication/presentation/screens/registration_screen.dart';
import '../../../../core/shared/appButton.dart';
import '../../../Home/Presentation/screens/home_screen.dart';
import '../widgets/header_widget.dart';
import '../widgets/reponsive_textfield.dart';
import '../widgets/visibility_icon.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              HeaderWidget(
                customClipper: BigClipper(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 270, left: 18, right: 18),
                child: Column(
                  children: [
                    Text(
                      'Hello',
                      style: theme.textTheme.displayMedium!.copyWith(
                          color: colorScheme.onSurface,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'SignIn into your account',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    ReusedTextField(
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      labelText: 'Email',
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Enter your email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    ReusedTextField(
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      labelText: 'Password',
                      isVisible: true,
                      prefixIcon: Icons.lock,
                      // suffixIcon: IconButton(
                      //   onPressed: () {
                      //     //TODO: add toggle feature here
                      //   },
                      //   icon: const VisibilityIcon(),
                      // ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Enter your password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            //TODO: navigate to forget password scrren
                          },
                          child: Text(
                            'forget password?',
                            style: textTheme.labelLarge!.copyWith(
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        )
                      },
                      title: "Sign In",
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New to Customer&Shopkeeper?",
                          style: textTheme.labelLarge!.copyWith(
                            letterSpacing: .5,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegistrationScreen()),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: textTheme.labelLarge!.copyWith(
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
