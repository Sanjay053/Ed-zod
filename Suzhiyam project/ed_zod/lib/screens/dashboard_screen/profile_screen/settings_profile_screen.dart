import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/widgets/dynamic_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.navigate_before,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.contain,width: 92,height: 92,
                ),
              ),
            ),
            const Text(
              'Hello, Chris',
              style: MyAppFontStyles.openSans22W400,
            ),
            const Text(
              'chrisjeri@gmail.com',
              style: MyAppFontStyles.openSans16W400,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: ProfilePageButton.profilePageButton(
                context,
                'Terms & Conditions',
                () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: ProfilePageButton.profilePageButton(
                context,
                'Privacy Policy',
                () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: ProfilePageButton.profilePageButton(
                context,
                'About Us',
                () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: ProfilePageButton.profilePageButton(
                context,
                'Notification Sound',
                () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
