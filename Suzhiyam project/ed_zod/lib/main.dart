import 'package:ed_zod/router/app_navigator_router.dart';
// import 'package:ed_zod/screens/authentication/forget_password/forget_password.dart';
// import 'package:ed_zod/screens/authentication/forget_password/reset_password.dart';
// import 'package:ed_zod/screens/authentication/login/login_screen.dart';
// import 'package:ed_zod/screens/authentication/signup/signup_screen.dart';
// import 'package:ed_zod/screens/dashboard_screen/dashboard_screen.dart';
// import 'package:ed_zod/screens/onboard_screen.dart';
// import 'package:ed_zod/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppNavigation.router,
      title: 'ED-ZOD',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 44, 41, 123)),
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      
      // initialRoute: '/',
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/': (context) => const SplashScreen(),
      //   '/onboard': (context) => const OnBoardingScreen(),
      //   '/register': (context) => const SignUpScreen(),
      //   '/login': (context) => const LogInScreen(),
      //   '/forget': (context) => const ForgetPasswordScreen(),
      //   '/resetpass': (context) => const ResetPasswordScreen(),
      //   '/dashboard': (context) => const DashboardScreen(),
      //   },
    );
  }
}


// routerConfig: AppNavigation.router,