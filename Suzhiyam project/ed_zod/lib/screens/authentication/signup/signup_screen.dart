import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/widgets/dynamic_button.dart';
import 'package:ed_zod/widgets/dynamic_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Create Account',
                  style: MyAppFontStyles.openSans14W700,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Create an account to start your learning',
                  style: MyAppFontStyles.openSans12W400,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  ' Sign up with email',
                  style: MyAppFontStyles.openSans12W400,
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // first name
                            Expanded(
                              child: CustomTextFormField(
                                  label: 'First Name',
                                  hintText: 'Enter First Name',
                                  controller: firstName,
                                  validator: (value) {
                                    return value;
                                  },
                                  onChanged: (value) {}),
                            ),

                            const SizedBox(width: 10.0),
                            // last name
                            Expanded(
                              child: CustomTextFormField(
                                  label: 'Last Name',
                                  hintText: 'Enter Last Name',
                                  controller: lastName,
                                  validator: (value) {
                                    return value;
                                  },
                                  onChanged: (value) {}),
                            ),
                          ],
                        ),
                      ),
                      // Email
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                            label: 'Email',
                            hintText: 'Enter email address',
                            controller: email,
                            validator: (value) {
                              return value;
                            },
                            onChanged: (value) {}),
                      ),

                      // Phonenumber
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                            label: 'Phone Number',
                            hintText: 'Enter phone number',
                            controller: phoneNumber,
                            validator: (value) {
                              return value;
                            },
                            onChanged: (value) {}),
                      ),
                      // password
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                            label: 'Password',
                            hintText: 'Enter password',
                            controller: password,
                            validator: (value) {
                              return value;
                            },
                            onChanged: (value) {}),
                      ),

                      // confirm password
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                            label: 'Confirm password',
                            hintText: 'Confirm password',
                            controller: confirmPassword,
                            validator: (value) {
                              return value;
                            },
                            onChanged: (value) {}),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            activeColor: myButtonBlueColor,
                            value: isClicked,
                            onChanged: (bool? check) {
                              if (check != null) {
                                setState(() {
                                  isClicked = check;
                                });
                              }
                            },
                          ),
                          Expanded(
                            child: SelectableText.rich(
                              TextSpan(
                                style: MyAppFontStyles.openSans10W600BlackColor,
                                children: [
                                  const TextSpan(
                                    text: 'By continuing you agree to our ',
                                    style: MyAppFontStyles
                                        .openSans10W600BlackColor,
                                  ),
                                  TextSpan(
                                    text: 'terms & conditions',
                                    style:
                                        MyAppFontStyles.openSans10W600BlueColor,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Handle onTap for terms & conditions
                                      },
                                  ),
                                  const TextSpan(
                                    text: ' and ',
                                    style: MyAppFontStyles
                                        .openSans10W600BlackColor,
                                  ),
                                  TextSpan(
                                    text: 'privacy policy',
                                    style:
                                        MyAppFontStyles.openSans10W600BlueColor,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Handle onTap for privacy policy
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // sign up button
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CommonButton.commonButton(
                          context,
                          'Sign up',
                          myButtonBlueColor,
                          myWhiteColor,
                          myButtonBlueColor,
                          () {
                            // GoRouter.of(context).push('/login');

                          },
                          0.6,
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: MyAppFontStyles.openSans10W600,
                    children: [
                      const TextSpan(
                          text: "I already have an account ",
                          style: MyAppFontStyles.openSans10W600BlackColor),
                      TextSpan(
                        text: "login",
                        style: MyAppFontStyles.openSans10W600BlueColor,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, '/login', (route) => true);
                            GoRouter.of(context).push('/login');

                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
