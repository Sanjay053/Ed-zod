import 'package:ed_zod/components/popup_dialouge.dart';
import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/utils/constants/app_strings.dart';
import 'package:ed_zod/utils/constants/app_urls.dart';
import 'package:ed_zod/widgets/dynamic_button.dart';
import 'package:ed_zod/widgets/dynamic_textfield.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailAddress = TextEditingController();
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
                  MyAppStrings.fPaswdFPaswdScreen,
                  style: MyAppFontStyles.openSans32W700BlueColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(MyAppStrings.descriptionPaswdScreen,
                    style: MyAppFontStyles.openSans14W400GrayColor,
                    textAlign: TextAlign.left,
                    softWrap: true),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    controller: emailAddress,
                    isPrefix: true,
                    isLableStyle: true,
                    height: 50,
                    label: MyAppStrings.emailAddress,
                    onChanged: (value) {},
                    validator: (value) {
                      return value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CommonButton.commonButton(
                      context,
                      MyAppStrings.recoverPassword,
                      myButtonBlueColor,
                      myWhiteColor,
                      myButtonBlueColor,
                      () {
                        AlertDialogueBox.showOTPDialog(context, '123456');
                      },
                      .4,
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
