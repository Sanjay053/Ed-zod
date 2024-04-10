import 'package:ed_zod/models/chapter_list_model.dart';
import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:flutter/material.dart';

class ChapterTile extends StatefulWidget {
  final Chapter chapterData;
  const ChapterTile({super.key, required this.chapterData});

  @override
  State<ChapterTile> createState() => _ChapterTileState();
}

class _ChapterTileState extends State<ChapterTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: CircleAvatar(
        child: Image.asset('assets/images/chapter_leading.png'),
      ),
      title: Text('Chapter ${widget.chapterData.number}'),
      titleTextStyle: MyAppFontStyles.nunito10W700BlackColor,
      subtitle: Text(
        widget.chapterData.title,
      ),
      subtitleTextStyle: MyAppFontStyles.nunito12W700BlackColor,
    );
  }
}
