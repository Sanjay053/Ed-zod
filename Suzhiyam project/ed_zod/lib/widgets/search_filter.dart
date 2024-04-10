import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return 
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchAnchor(builder: (context, controller) {
                    return Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            width: 1, color: mysearchBoxBorderGrayColor),
                      ),
                      child: SearchBar(
                        hintText: 'Search for topics',
                        hintStyle: MaterialStateTextStyle.resolveWith(
                            (states) => MyAppFontStyles.nunito12W700BlackColor),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => myWhiteColor),
                        elevation: const MaterialStatePropertyAll(0),
                        leading: Image.asset(
                          'assets/icons/search.png',
                          width: 11,
                          height: 11,
                          color: mySearchIconBgGrayColor,
                        ),
                      ),
                    );
                  }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          setState(() {
                            controller.closeView(item);
                          });
                        },
                      );
                    });
                  }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // foregroundColor: myfilterButtonBorderGrayColor,
                      // backgroundColor: myWhiteColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1, color: myfilterButtonBorderGrayColor),
                        borderRadius:
                            BorderRadius.circular(6), // Rounded corners
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/icons/filter.png',
                            height: 11, color: myfilterButtonTextGrayColor),
                        const SizedBox(
                            width: 10), // Add some space between icon and text
                        const Text(
                          'Filter',
                          style: MyAppFontStyles.openSans14W400BlackColor,
                        ), // Text
                      ],
                    ),
                  ),
                ),
              )
        ],
      );
  }
}