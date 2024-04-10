import 'package:ed_zod/models/page_model.dart';
import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/utils/constants/app_strings.dart';
import 'package:ed_zod/widgets/dynamic_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();
  final controller = OnboardingData();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [body(), buildDots(), button()],
          ),
      ),
    );
  }

// body
  Widget body() {
    return Expanded(
      flex: 5,
      child: Center(
        child: PageView.builder(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // image
                Image.asset(
                  controller.items[index].image,
                ),
                const SizedBox(
                  height: 40,
                ),
                // title
                Text(
                  controller.items[index].title,
                  style: MyAppFontStyles.openSans18W700,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                // body
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    controller.items[index].body,
                    style: MyAppFontStyles.openSans14W400,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

// dot
  Widget buildDots() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.items.length,
          (index) => AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: currentIndex == index
                      ? myButtonBlueColor
                      : myDotGrayColor),
              height: currentIndex == index ? 5 : 4,
              width: currentIndex == index ? 32 : 4),
        ),
      ),
    );
  }

// button
  Widget button() {
    return Expanded(
      flex: currentIndex == controller.items.length - 1 ? 1 : 0,
      child: currentIndex == controller.items.length - 1
          ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommonButton.commonButton(
                    context,
                    MyAppStrings.loginButtonLabel,
                    myButtonBlueColor,
                    myWhiteColor,
                    myButtonBlueColor,
                    () {
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, '/login', (route) => true);
                     GoRouter.of(context).go('/login');
                    },
                    0.8,
                  ),
                ),
                // const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 10),
                  child: CommonButton.commonButton(
                    context,
                    MyAppStrings.signUpButtonLabel,
                    myButtonGrayColor,
                    myWhiteColor,
                    myButtonGrayColor,
                    () {
                      context.go('/register');
                    },
                    0.8,
                  ),
                ),
                
              ],
            )
          : Padding(
            padding: const EdgeInsets.all(24.0),
            child: CommonButton.commonButton(
                context,
                MyAppStrings.skipButtonLabel,
                myWhiteColor,
                Colors.black,
                myButtonBlueColor,
                skipFunction,
                0.7,
              ),
          ),
    );
  }

// skip Function
  void skipFunction() {
    setState(() {
      currentIndex = controller.items.length - 1 + 1;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }
}
