import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CommonButton {
  static Container commonButton(
      BuildContext context,
      String name,
      Color bgColor,
      Color textColor,
      Color borderColor,
      Function onPress,
      double width,
      {bool isborderradius = true}) {
    BorderRadius borderRadius =
        isborderradius ? BorderRadius.circular(5) : BorderRadius.circular(10.5);
    return Container(
      width: MediaQuery.of(context).size.width * width, //Button width
      height: 39,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          color: borderColor, // border color
          width: 1,
        ),
        color: bgColor, // Button Background Color
      ),
      child: ElevatedButton(
        onPressed: () {
          onPress(); // onPress function is called
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor, //Text Color
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: Text(
          name,
          style: MyAppFontStyles.openSans15W400,
        ), // Button Text
      ),
    );
  }
}

class ProfilePageButton {
  static Container profilePageButton(
    BuildContext context,
    String name,
    Function onPress,
    {bool isTextCenter = true}
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, //Button width
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: profileBorderWhiteColor,
          width: 1,
        ),
        color: myWhiteColor, // Button Background Color
      ),
      child: ElevatedButton(
        onPressed: () {
          onPress(); // onPress function is called
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: myprofilebuttonTextBlueColor, //Text Color
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.only(left: 20),
        ),
        child: Align(
          alignment: isTextCenter? Alignment.centerLeft : Alignment.center,
          child: Text(
            name,
            style: MyAppFontStyles.openSans16W400,
          ),
        ), // Button Text
      ),
    );
  }
}
