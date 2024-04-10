import 'package:ed_zod/components/course_tile.dart';
import 'package:ed_zod/models/company_list_model.dart';
import 'package:ed_zod/models/courses_list_model.dart';
import 'package:ed_zod/screens/dashboard_screen/dashboard_appbar.dart';
import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:flutter/material.dart';

class CompanyDetailsScreen extends StatefulWidget {
  final String companyId;

  const CompanyDetailsScreen({
    super.key,
    required this.companyId,
  });

  @override
  State<CompanyDetailsScreen> createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen> {
  final List<Course> courses = generateCourses();

  late Company _company;

  @override
  void initState() {
    super.initState();
    _company = findCompanyById(widget.companyId);
  }

  Company findCompanyById(String companyId) {
    return generateCompanies().firstWhere((company) => company.id == companyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(
        isDashboard: false,
        title: 'Company Details',
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Hero(
                  tag: 'companyimg ${_company.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      'https://picsum.photos/200',
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Text(
                _company.name,
                style: MyAppFontStyles.nunito20W700BlackColor,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Text(
                _company.workingArea,
                style: MyAppFontStyles.openSans14W400BlackColor,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Text(_company.location,
                  style: MyAppFontStyles.openSans14W400BlackColor),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "About",
                style: MyAppFontStyles.nunito16W700BlackColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Text(
                "Lorem ipsum dolor sit amet consectetur. Cursus ac consequat ornare donec tortor nunc cursus amet. Justo sed massa . Lorem ipsum dolor sit amet consectetur. Cursus ac consequat ornare donec tortor nunc cursus amet. Justo sed massa ",
                style: MyAppFontStyles.openSans14W400BlackColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Courses Offered :",
                style: MyAppFontStyles.nunito16W700BlackColor,
              ),
            ),
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: CourseTiles(
                      course: courses[index],
                      type: 2,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
