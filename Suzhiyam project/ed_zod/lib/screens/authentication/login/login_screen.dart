import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/utils/constants/app_strings.dart';
import 'package:ed_zod/utils/constants/app_urls.dart';
import 'package:ed_zod/widgets/dynamic_button.dart';
import 'package:ed_zod/widgets/dynamic_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailOrPhoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  MyAppStrings.loginScreenTopText,
                  style: MyAppFontStyles.openSans12W400,
                ),
                const SizedBox(height: 90),
                const Text(
                  MyAppStrings.signUpEmailText,
                  style: MyAppFontStyles.openSans12W400,
                ),
                const SizedBox(height: 20),
                // Email or phone number
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                      label: MyAppStrings.emailORPhoneNumberLabel,
                      hintText: MyAppStrings.emailORPhoneNumberHint,
                      onChanged: (value) {},
                      controller: password,
                      validator: (value) {
                        return value;
                      }),
                ),
                // password
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8.0, bottom: 0, right: 8.0),
                  child: CustomTextFormField(
                      label: MyAppStrings.passwordLabel,
                      hintText: MyAppStrings.passwordHint,
                      onChanged: (value) {},
                      controller: emailOrPhoneNumber,
                      validator: (value) {
                        return value;
                      }),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      // forget password
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors
                                .transparent), // Set background color to transparent
                            overlayColor: MaterialStateProperty.all(Colors
                                .transparent), // Set overlay color to transparent
                            side: MaterialStateProperty.all(
                                BorderSide.none), // Remove the border
                          ),
                          onPressed: () {
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, '/forget', (route) => true);
                            GoRouter.of(context).push('/forgetpwd');
                          },
                          child: const Text(
                            MyAppStrings.forgetPasswordLoginScreen,
                            style: MyAppFontStyles.openSans10W600BlueColor,
                          )),
                    ]),
                Image.asset(
                  MyAppUrls.lockLoginScreen,
                ),
                // login button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommonButton.commonButton(context, 'Login',
                      myButtonBlueColor, myWhiteColor, myButtonBlueColor, () {
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, '/dashboard', (route) => true);
                            GoRouter.of(context).push('/course');

                  }, 0.9),
                ),
                SelectableText.rich(
                  TextSpan(
                    style: MyAppFontStyles.openSans10W600BlackColor,
                    children: [
                      const TextSpan(
                        text: MyAppStrings.donthaveaccountLoginScreen,
                        style: MyAppFontStyles.openSans10W600BlackColor,
                      ),
                      TextSpan(
                        text: MyAppStrings.signUpButtonLabel,
                        style: MyAppFontStyles.openSans10W600BlueColor,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, '/register', (route) => true);
                            GoRouter.of(context).push('/register');

                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
