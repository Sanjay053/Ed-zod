import 'package:ed_zod/screens/authentication/forget_password/forget_password.dart';
import 'package:ed_zod/screens/authentication/forget_password/reset_password.dart';
import 'package:ed_zod/screens/authentication/login/login_screen.dart';
import 'package:ed_zod/screens/authentication/signup/signup_screen.dart';
import 'package:ed_zod/screens/dashboard_screen/course_screen/company_details.dart';
import 'package:ed_zod/screens/dashboard_screen/course_screen/course_screen.dart';
import 'package:ed_zod/screens/dashboard_screen/dashboard_screen.dart';
import 'package:ed_zod/screens/dashboard_screen/job_screen/job_details.dart';
import 'package:ed_zod/screens/dashboard_screen/job_screen/job_screen.dart';
import 'package:ed_zod/screens/dashboard_screen/product_screen/product_screen.dart';
import 'package:ed_zod/screens/dashboard_screen/profile_screen/edit_profile_screen.dart';
import 'package:ed_zod/screens/dashboard_screen/profile_screen/profile_password_edit_screen.dart';
import 'package:ed_zod/screens/dashboard_screen/profile_screen/profile_screen.dart';
import 'package:ed_zod/screens/dashboard_screen/profile_screen/settings_profile_screen.dart';
import 'package:ed_zod/screens/onboard_screen.dart';
import 'package:ed_zod/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static String initialRoute = '/';
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorCourse =
      GlobalKey<NavigatorState>(debugLabel: 'shellCourse');
  static final _rootNavigatorJob =
      GlobalKey<NavigatorState>(debugLabel: 'shellJob');
  static final _rootNavigatorProduct =
      GlobalKey<NavigatorState>(debugLabel: 'shellProduct');
  static final _rootNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

  static final GoRouter router = GoRouter(
      initialLocation: initialRoute,
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      errorBuilder: (context, state) {
        return const Text('Something went wrong!');
      },
      routes: <RouteBase>[
        // splash screen
        GoRoute(
          path: initialRoute,
          builder: (context, state) => const SplashScreen(),
        ),
        // onboard
        GoRoute(
          path: '/onboard',
          name: 'Onboard',
          builder: (context, state) => const OnBoardingScreen(),
        ),
        // login
        GoRoute(
          path: '/login',
          name: 'Login',
          builder: (context, state) => const LogInScreen(),
        ),
        // register
        GoRoute(
          path: '/register',
          name: 'Register',
          builder: (context, state) => const SignUpScreen(),
        ),
        // forget password
        GoRoute(
          path: '/forgetpwd',
          name: 'Forgetpwd',
          builder: (context, state) => const ForgetPasswordScreen(),
        ),
        // reset password
        GoRoute(
          path: '/restpwd',
          name: 'Restpwd',
          builder: (context, state) => const ResetPasswordScreen(),
        ),
        // dashboard screen
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return DashboardScreen(
              navigationShell: navigationShell,
            );
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              navigatorKey: _rootNavigatorCourse,
              routes: [
                GoRoute(
                  path: '/course',
                  name: 'Course',
                  builder: (context, state) {
                    return CourseScreen(key: state.pageKey);
                  },
                  routes: [
                    GoRoute(
                      path: 'companyDetails/:companyId',
                      name: 'CompanyDetails',
                      builder: (context, state) {
                        final companyId = state.pathParameters['companyId'];
                        return CompanyDetailsScreen(
                          companyId: companyId.toString(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _rootNavigatorJob,
              routes: [
                GoRoute(
                  path: '/job',
                  name: 'Job',
                  builder: (context, state) {
                    return JobScreen(key: state.pageKey);
                  },
                  routes: [
                    GoRoute(
                      path: 'jobDetail',
                      name: 'JobDetail',
                      builder: (context, state) {
                        return const JobDetailsScreen();
                      },
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _rootNavigatorProduct,
              routes: [
                GoRoute(
                  path: '/product',
                  name: 'Proudct',
                  builder: (context, state) {
                    return ProductScreen(key: state.pageKey);
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _rootNavigatorProfile,
              routes: [
                GoRoute(
                  path: '/profile',
                  name: 'Profile',
                  builder: (context, state) {
                    return ProfileScreen(key: state.pageKey);
                  },
                  routes: [
                    GoRoute(
                      path: 'editprofile',
                      name: 'EditProfile',
                      builder: (context, state) {
                        return const ProfileEditScreen();
                      },
                    ),
                    GoRoute(
                      path: 'setting',
                      name: 'Setting',
                      builder: (context, state) {
                        return const ProfileSettingScreen();
                      },
                    ),GoRoute(
                      path: 'custompasword',
                      name: 'CustomPassword',
                      builder: (context, state) {
                        return const ProfilePasswordEditScreen();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ]);
}
