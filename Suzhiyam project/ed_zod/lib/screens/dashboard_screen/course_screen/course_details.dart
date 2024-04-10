import 'package:ed_zod/models/chapter_list_model.dart';
import 'package:ed_zod/models/courses_list_model.dart';
import 'package:ed_zod/screens/dashboard_screen/course_screen/course_lession.dart';
import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/utils/constants/app_strings.dart';
import 'package:ed_zod/widgets/dynamic_button.dart';
import 'package:ed_zod/widgets/favorite_icon.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  final Course course;
  const CourseDetails({super.key, required this.course});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  final List<Chapter> chapters = generateChapters();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.navigate_before,
            color: myBlackColor,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Course Details",
                style: MyAppFontStyles.nunito16W700BlackColor,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const CourseLession();
                          },
                        ));
                      },
                      child: Image.network(
                        'https://picsum.photos/200',
                        width: MediaQuery.of(context).size.width * .9,
                        height: MediaQuery.of(context).size.height * .25,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.course.name,
                      style: MyAppFontStyles.nunito16W700BlackColor,
                    ),
                    const FavoriteIcon()
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                child: Text(
                  "Robert Henry Stone",
                  style: MyAppFontStyles.nunito10W700BlackColor,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                child: Row(
                  children: [
                    Image.asset('assets/icons/Timer.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("24h 45min"),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset('assets/icons/Star.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("4.0 Ratings")
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonButton.commonButton(
                        context,
                        "Add to Cart",
                        myWhiteColor,
                        myNavUnSelectedGrayColor,
                        myfilterButtonTextGrayColor,
                        () {},
                        .35,
                        isborderradius: false),
                    // const SizedBox(width: 10,),
                    CommonButton.commonButton(
                        context,
                        "Buy Course",
                        myButtonBlueColor,
                        myWhiteColor,
                        myButtonBlueColor,
                        () {},
                        .35,
                        isborderradius: false),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                child: Text(
                  "Course Description :",
                  style: MyAppFontStyles.openSans16W600,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                child: Text(
                  MyAppStrings.randomDescription,
                  style: MyAppFontStyles.openSans14W400,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                child: Text(
                  "What You’ll Learn :",
                  style: MyAppFontStyles.openSans16W600,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                child: Text(
                  MyAppStrings.randomDescription,
                  style: MyAppFontStyles.openSans14W400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
