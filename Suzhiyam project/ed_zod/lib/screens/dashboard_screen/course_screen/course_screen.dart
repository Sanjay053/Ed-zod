import 'package:ed_zod/components/company_tile.dart';
import 'package:ed_zod/components/course_tile.dart';
import 'package:ed_zod/models/company_list_model.dart';
import 'package:ed_zod/models/courses_list_model.dart';
import 'package:ed_zod/screens/dashboard_screen/dashboard_appbar.dart';
import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/widgets/search_filter.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final List<String> filters = ['Filter 1', 'Filter 2', 'Filter 3'];
  final Set<String> selectedFilters = {};

  final List<Company> companies = generateCompanies();
  final List<Course> courses = generateCourses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(isDashboard: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // searching
            const SearchFilter(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Wrap(
                spacing: 10.0,
                children: filters.map((filter) {
                  return ChoiceChip(
                    label: Text(filter,
                        style: selectedFilters.contains(filter)
                            ? MyAppFontStyles.openSans10W400WhiteColor
                            : MyAppFontStyles.openSans10W400BlackColor),
                    selected: selectedFilters.contains(filter),
                    selectedColor: mySelectedChipBlueColor,
                    backgroundColor: myUnSelectedChipGrayColor,
                    showCheckmark: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.5),
                    ),
                    side: BorderSide.none,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedFilters.add(filter);
                        } else {
                          selectedFilters.remove(filter);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Popular Companies',
                style: MyAppFontStyles.nunito24W700BlackColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( vertical: 8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.16,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: companies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: CompanyTile(
                            index: index,
                            data: companies,
                            courseData: courses,
                          )),
                    );
                  },
                ),
              ),
            ),
            // Hot Movings
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              child: Text(
                'Hot Movings',
                style: MyAppFontStyles.nunito24W700BlackColor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: CourseTiles(
                          course: courses[index],
                          type: 1,
                        )),
                  );
                },
              ),
            ),
            //Popular Searches
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              child: Text(
                'Popular Searches',
                style: MyAppFontStyles.nunito24W700BlackColor,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: CourseTiles(
                          course: courses[index],
                          type: 1,
                        )),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
