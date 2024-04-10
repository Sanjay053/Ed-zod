import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/utils/constants/app_strings.dart';
import 'package:ed_zod/utils/constants/app_urls.dart';
import 'package:ed_zod/widgets/dynamic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlertDialogueBox {
  static Future<void> showOTPDialog(BuildContext context, String otp) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to close dialog.
      builder: (BuildContext context) {
        return otpAlertDialog(otp, context);
      },
    );
  }

  static AlertDialog otpAlertDialog(String otp, BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      title: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(MyAppUrls.pageClosingIcon),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 20.0),
            child: Center(
              child: Text(
                MyAppStrings.otpVerfication,
                style: MyAppFontStyles.nunito22W500BlueColor,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            MyAppStrings.otpDescription,
            style: MyAppFontStyles.nunito16W500GrayColor,
            softWrap: true,
            textAlign: TextAlign.center,
          )
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 53,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      onSaved: (pin1) {},
                      style: MyAppFontStyles.nunito18W500BlackColor,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red), // Default border color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 53,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      onSaved: (pin2) {},
                      style: MyAppFontStyles.nunito18W500BlackColor,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 53,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      onSaved: (pin3) {},
                      style: MyAppFontStyles.nunito18W500BlackColor,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 53,
                    child: TextFormField(
                      onChanged: (value) {},
                      onSaved: (pin4) {},
                      style: MyAppFontStyles.nunito18W500BlackColor,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                MyAppStrings.incorrectOtp,
                style: MyAppFontStyles.nunito10W500RedColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SelectableText.rich(
                TextSpan(
                  style: MyAppFontStyles.openSans10W600BlackColor,
                  children: [
                    TextSpan(
                      text: MyAppStrings.optNotRecive,
                      style: MyAppFontStyles.nunito12W500,
                    ),
                    TextSpan(
                      text: 'Resent (45s)',
                      style: MyAppFontStyles.nunito12W500RedColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Align(
          alignment: Alignment.center,
          child: CommonButton.commonButton(
            context,
            MyAppStrings.verifyButton,
            myButtonBlueColor,
            myWhiteColor,
            myButtonBlueColor,
            () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/resetpass', (route) => true);
            },
            .3,
          ),
        )
      ],
    );
  }
}
