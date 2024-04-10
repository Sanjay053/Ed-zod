import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/widgets/dynamic_button.dart';
import 'package:ed_zod/widgets/profile_editing_field.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Edit Profile',
                    style: MyAppFontStyles.nunito22W400BlueColor,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 145,
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Upload a Photo'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: const Text(
                              'Max file size is 5MB, Minimum dimension:'
                              ' 200x200 And Suitable files are .jpg & .png ',
                              style: MyAppFontStyles.openSans14W400GrayColor,
                              // softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomProfileEditField(
                    label: 'First Name',
                    prefixIcon: const Icon(Icons.person_outline),
                    controller: firstName,
                    validator: (value) {
                      return value;
                    },
                    onChanged: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomProfileEditField(
                    label: 'Last Name',
                    prefixIcon: const Icon(Icons.person_outline),
                    controller: lastName,
                    validator: (value) {
                      return value;
                    },
                    onChanged: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomProfileEditField(
                    label: 'Email Address',
                    prefixIcon: const Icon(Icons.mail_outline),
                    controller: email,
                    validator: (value) {
                      return value;
                    },
                    onChanged: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomProfileEditField(
                    label: 'Phone Number',
                    prefixIcon: const Icon(Icons.phone_outlined),
                    controller: phoneNumber,
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
                      0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
