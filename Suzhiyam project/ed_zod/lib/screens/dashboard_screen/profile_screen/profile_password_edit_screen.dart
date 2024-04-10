import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/widgets/dynamic_button.dart';
import 'package:ed_zod/widgets/profile_editing_field.dart';
import 'package:flutter/material.dart';

class ProfilePasswordEditScreen extends StatefulWidget {
  const ProfilePasswordEditScreen({super.key});

  @override
  State<ProfilePasswordEditScreen> createState() =>
      _ProfilePasswordEditScreenState();
}

class _ProfilePasswordEditScreenState extends State<ProfilePasswordEditScreen> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Change Password',
                    style: MyAppFontStyles.nunito22W400BlueColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomProfileEditField(
                    label: 'Old Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    controller: oldPassword,
                    validator: (value) {
                      return value;
                    },
                    onChanged: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomProfileEditField(
                    label: 'New Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    controller: newPassword,
                    validator: (value) {
                      return value;
                    },
                    onChanged: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomProfileEditField(
                    label: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    controller: confirmPassword,
                    validator: (value) {
                      return value;
                    },
                    onChanged: () {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CommonButton.commonButton(
                      context,
                      'Save Changes',
                      myButtonBlueColor,
                      myWhiteColor,
                      myButtonBlueColor,
                      () {},
                      0.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
