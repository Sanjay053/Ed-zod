import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/widgets/dynamic_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _navigateToEditProfile() {
    GoRouter.of(context).goNamed('EditProfile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.navigate_before,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).goNamed('Setting');
              },
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
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
                  fit: BoxFit.contain,
                  width: 92,
                  height: 92,
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
                'Edit Profile',
                _navigateToEditProfile,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: ProfilePageButton.profilePageButton(
                context,
                'Change Password',
                () {
                  GoRouter.of(context).goNamed('CustomPassword');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: ProfilePageButton.profilePageButton(
                context,
                'My Purchases',
                () {},
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: ProfilePageButton.profilePageButton(
                context,
                'Log out',
                () {},
                isTextCenter: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
