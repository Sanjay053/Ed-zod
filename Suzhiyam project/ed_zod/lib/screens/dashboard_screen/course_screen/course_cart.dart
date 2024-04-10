import 'dart:math';

import 'package:ed_zod/components/course_tile.dart';
import 'package:ed_zod/models/courses_list_model.dart';
import 'package:ed_zod/screens/dashboard_screen/dashboard_appbar.dart';
import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/widgets/dynamic_button.dart';
import 'package:flutter/material.dart';

class CourseCartScreen extends StatefulWidget {
  const CourseCartScreen({super.key});

  @override
  State<CourseCartScreen> createState() => _CourseCartScreenState();
}

class _CourseCartScreenState extends State<CourseCartScreen> {
  final List<Course> courses = generateCourses();
  double subtotal = 0.0;

  @override
  void initState() {
    super.initState();
    calculateSubtotal(); // Calculate subtotal when the widget is initialized
  }

  void calculateSubtotal() {
    for (int i = 0; i < min(4, courses.length); i++) {
      subtotal += courses[i].cost;
    }
  }

  @override
  void dispose() {
    calculateSubtotal();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(
        isDashboard: false,
        title: "My Courses",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: min(4, courses.length),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: CourseTiles(
                    type: 2,
                    course: courses[index],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Material(
              elevation: 4.0,
              shadowColor: const Color(0x7E000000),
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFFE6E6E6), width: 1.0),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 351,
                      height: 59,
                      decoration: const BoxDecoration(
                        color: Color(0x187F7E97),
                      ),
                      child: const Center(
                        child: Text("Order Summary",
                            style: MyAppFontStyles.nunito18W600BlackColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Sub Total",
                            style: MyAppFontStyles.openSans14W600GrayColor,
                          ),
                          Text("\$ ${subtotal.toStringAsFixed(2)}",
                              style: MyAppFontStyles.openSans14W600GrayColor),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Total",
                            style: MyAppFontStyles.openSans14W700,
                          ),
                          Text("\$ ${subtotal.toStringAsFixed(2)}",
                              style: MyAppFontStyles.openSans14W700),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 28),
            child: CommonButton.commonButton(
              context,
              'Checkout',
              myButtonBlueColor,
              myWhiteColor,
              myButtonBlueColor,
              () {},
              0.9,
            ),
          ),
        ],
      ),
    );
  }
}
