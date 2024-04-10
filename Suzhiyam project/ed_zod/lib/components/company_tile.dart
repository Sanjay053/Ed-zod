import 'package:ed_zod/models/company_list_model.dart';
import 'package:ed_zod/models/courses_list_model.dart';
import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CompanyTile extends StatelessWidget {
  final int index;
  final List<Company> data;
  final List<Course> courseData;
  const CompanyTile(
      {super.key,
      required this.index,
      required this.data,
      required this.courseData});

  @override
  Widget build(BuildContext context) {
    final Company company = data[index];
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(5.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'companyimg $index',
                  child: Image.network(
                    "https://picsum.photos/200",
                    width: 50, // Example width
                    height: 50, // Example height
                  ),
                ),
                const SizedBox(
                    width: 8), // Add some spacing between the image and text
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company.name.length > 17
                            ? company.name.substring(0, 17)
                            : company.name,
                        overflow: TextOverflow.ellipsis,
                        style: MyAppFontStyles.openSans12W600BlackColor,
                        softWrap: true,
                      ),
                      const SizedBox(height: 4), // Add some vertical spacing
                      Text(company.workingArea,
                          style: MyAppFontStyles.openSans8W400BlackColor),
                      Text(company.location,
                          style: MyAppFontStyles.openSans8W400BlackColor)
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/icons/courses.png'),
                Text(
                  '${company.courseNumbers} Courses',
                  style: MyAppFontStyles.openSans10W600,
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      'CompanyDetails',
                      pathParameters: {'companyId': company.id},
                    );
                  },
                  child: Container(
                    width: 52,
                    // height: 16,
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.5),
                      color: myViewButtonBlueColor,
                    ),
                    child: const Center(
                      child: Text(
                        "View",
                        style: MyAppFontStyles
                            .openSans8W400WhiteColor, // Adjust the text color as needed
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
