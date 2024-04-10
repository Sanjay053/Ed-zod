import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/utils/constants/app_strings.dart';
import 'package:ed_zod/utils/constants/app_urls.dart';
import 'package:ed_zod/widgets/dynamic_button.dart';
import 'package:ed_zod/widgets/dynamic_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(); // Close the current page
          },
          child: Image.asset(MyAppUrls.leftArrowIcon),
        ),
        actions: [
          IconButton(
            icon: Image.asset(MyAppUrls.pageClosingIcon),
            onPressed: () {
              Navigator.of(context).pop(); // Close the current page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 90,
                ),
                const Text(
                  MyAppStrings.resetPwdHeading,
                  style: MyAppFontStyles.openSans32W700BlueColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(MyAppStrings.resetPwdDescription,
                    style: MyAppFontStyles.openSans14W400GrayColor,
                    textAlign: TextAlign.left,
                    softWrap: true),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    controller: password,
                    isPrefix: true,
                    isLableStyle: true,
                    height: 50,
                    label: MyAppStrings.newPaswordLabel,
                    onChanged: (value) {},
                    validator: (value) {
                      return value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    controller: confirmPassword,
                    isPrefix: true,
                    isLableStyle: true,
                    height: 50,
                    label: MyAppStrings.confirmPaswordLabel,
                    onChanged: (value) {},
                    validator: (value) {
                      return value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommonButton.commonButton(
                      context,
                      MyAppStrings.resetPwdHeading,
                      myButtonBlueColor,
                      myWhiteColor,
                      myButtonBlueColor,
                      () {},
                      .4,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SelectableText.rich(
                    TextSpan(
                      style: MyAppFontStyles.openSans10W600BlackColor,
                      children: [
                        const TextSpan(
                          text: MyAppStrings.dontDoResetPwdScreen,
                          style: MyAppFontStyles.openSans10W600BlackColor,
                        ),
                        TextSpan(
                          text: MyAppStrings.loginRestPwdScreen,
                          style: MyAppFontStyles.openSans10W600BlueColor,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/register', (route) => true);
                            },
                        ),
                      ],
                    ),
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
