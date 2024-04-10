import 'package:ed_zod/components/course_chapter_tile.dart';
import 'package:ed_zod/models/chapter_list_model.dart';
import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CourseLession extends StatefulWidget {
  const CourseLession({super.key});

  @override
  State<CourseLession> createState() => _CourseLessionState();
}

class _CourseLessionState extends State<CourseLession> {
  final List<Chapter> chapters = generateChapters();
  late bool isVideo;

  @override
  void initState() {
    isVideo = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            isVideo
                ? Navigator.pop(context)
                : setState(() {
                    isVideo = true;
                  });
          },
          icon: Icon(
            Icons.navigate_before,
            color: myBlackColor,
            size: 30,
          ),
        ),
        actions: !isVideo? [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal:  16.0),
            child: Icon(Icons.more_horiz),
          )
        ]: null,
      ),
      body: isVideo
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Text(
                      "Lessons",
                      style: MyAppFontStyles.nunito16W700BlackColor,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isVideo = false;
                            });
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
                  const SizedBox(
                    height: 60,
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                    child: Text(
                      "All Chapters",
                      style: MyAppFontStyles.nunito16W700BlackColor,
                    ),
                  ),
                  SizedBox(
                    child: ListView.builder(
                      itemCount: chapters.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Column(
                              children: [
                                const Divider(color: Colors.grey),
                                ChapterTile(chapterData: chapters[index]),
                              ],
                            ));
                      },
                    ),
                  )
                ],
              ),
            )
          : const _LessionVideo(),
    );
  }
}

// lession video screen
class _LessionVideo extends StatefulWidget {
  const _LessionVideo();

  @override
  State<_LessionVideo> createState() => __LessionVideoState();
}

class __LessionVideoState extends State<_LessionVideo> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("lession video"),
    );
  }
}
