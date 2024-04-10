import 'package:ed_zod/screens/dashboard_screen/course_screen/course_cart.dart';
import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDashboard;
  final String title;
  const DashboardAppBar({super.key, this.isDashboard = false, this.title = ""});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: isDashboard ? 200 : 220,
      toolbarHeight: 100,
      backgroundColor: myLogoBackgroundColor,
      leading: isDashboard
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Image.asset(
                      'assets/images/profile-img.png',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome !',
                        style: MyAppFontStyles.nunito12W500WhiteColor,
                      ),
                      Text(
                        'Chris Jeri',
                        style: MyAppFontStyles.nunito16W700WhiteColor,
                      )
                    ],
                  )
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.navigate_before,
                        color: myWhiteColor,
                      )),
                  Text(
                    title,
                    style: MyAppFontStyles.nunito20W700WhiteColor,
                  )
                ],
              ),
            ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CourseCartScreen();
              }));
            },
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFF1F6FC),
              child: Image.asset(
                'assets/icons/cart.png',
                width: 40,
                height: 40,
              ),
            )),
        IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFF1F6FC),
              child: Image.asset(
                'assets/icons/notification.png',
                width: 20,
                height: 20,
              ),
            )),
      ],
      elevation: 4,
    );
  }
}
