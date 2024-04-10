import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/utils/constants/app_strings.dart';
import 'package:ed_zod/utils/constants/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.pushNamedAndRemoveUntil(context, '/onboard', (route) => true);
      GoRouter.of(context).goNamed('Onboard');
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 285,
          height: 285,
          decoration: BoxDecoration(
            color: myLogoBackgroundColor,
            borderRadius: BorderRadius.circular(142.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                MyAppUrls.appLogoSplashScreen,
                width: 103,
                height: 103,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                MyAppStrings.splashScreenText,
                style: MyAppFontStyles.nunito24W700WhiteColor
              ),
            ],
          ),
        ),
      ),
    );
  }
}
