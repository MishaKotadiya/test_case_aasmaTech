import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/shared/appButton.dart';
import '../../../Home/Presentation/screens/home_screen.dart';
import '../bloc/checkbox_cubit.dart';
import '../bloc/visibility_cubit.dart';
import '../widgets/reponsive_textfield.dart';
import '../widgets/visibility_icon.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  static const String routeName = '/register';

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static final TextEditingController _emailController = TextEditingController();

  static final TextEditingController _passwordController =
  TextEditingController();

  static final TextEditingController _confirmPasswordController =
  TextEditingController();

  static final TextEditingController _firstNameController =
  TextEditingController();

  static final TextEditingController _lastNameController =
  TextEditingController();

  static final TextEditingController _mobileNumberController =
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

              Padding(
                padding: const EdgeInsets.only(top: 130, left: 18, right: 18),
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: theme.textTheme.displayMedium!.copyWith(
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Get your requirement quickly',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: colorScheme.onSurface),
                            controller: _firstNameController,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              labelText: "First Name",
                              prefixIcon: Icon(
                                Icons.person,
                                color: colorScheme.secondary,
                              ),
                            ),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Enter your First Name';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: colorScheme.onSurface),
                            controller: _lastNameController,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              labelText: "Last Name",
                              prefixIcon: Icon(
                                Icons.person,
                                color: colorScheme.secondary,
                              ),
                            ),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Enter your Last Name';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ReusedTextField(
                      inputFormatter: [LengthLimitingTextInputFormatter(10)],
                      keyboardType: TextInputType.phone,
                      controller: _mobileNumberController,
                      labelText: "Phone Number",
                      prefixIcon: Icons.call,
                      validator: (value) {
                        if (value != null && value.length < 10) {
                          return 'Phone number should of 10 digit';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    ReusedTextField(
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      labelText: "Email address",
                      prefixIcon: Icons.email,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Enter your email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: "Fruits",
                      decoration: InputDecoration(
                        labelText: 'Tag',
                        prefixIcon: Icon(Icons.category),
                      ),
                      items: <String>['Fruits', 'Vegetable', 'All Grocery'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {

                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a tag';
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(height: 10),
                    ReusedTextField(
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.visiblePassword,
                      isVisible: true,
                      controller: _passwordController,
                      labelText: 'Password',
                      prefixIcon: Icons.lock,

                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Enter your password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    ReusedTextField(
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.visiblePassword,
                      isVisible: true,
                      controller: _confirmPasswordController,
                      labelText: "Confirm Password",
                      prefixIcon: Icons.lock,
                      // suffixIcon: IconButton(
                      //   onPressed: () =>
                      //       context.read<VisibilityCubit>().toggle(),
                      //   icon: const VisibilityIcon(),
                      // ),
                      validator: (value) {
                        if (value != null &&
                            !value.contains(_passwordController.text)) {
                          return 'The password does not match';
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          activeColor: Colors.black,
                          value: false,
                          onChanged: (bool? value) {  },

                          ),
                        
                        Row(
                          children: [
                            const Text(
                              "I accept all ",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 3),
                            GestureDetector(
                              onTap: () {
                              },
                              child: Text(
                                'terms and conditions',
                                style: textTheme.labelLarge!.copyWith(
                                  letterSpacing: 1,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    AppButton(
                        onPressed: () => {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        )
                        },
                        title: 'Sign Up',
                      ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Joined us before?",
                          style: textTheme.labelLarge!.copyWith(
                            letterSpacing: .5,
                          ),
                        ),
                        TextButton(
                          onPressed: ()  {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            'Sign In',
                            style: textTheme.labelLarge!.copyWith(
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
