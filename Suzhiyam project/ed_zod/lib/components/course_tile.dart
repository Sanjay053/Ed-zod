import 'package:ed_zod/models/courses_list_model.dart';
import 'package:ed_zod/screens/dashboard_screen/course_screen/course_details.dart';
import 'package:flutter/material.dart';
import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:ed_zod/widgets/favorite_icon.dart';
import 'package:ed_zod/widgets/start_rating.dart';

class CourseTiles extends StatefulWidget {
  final Course course;
  final int type;

  const CourseTiles({super.key, required this.course, required this.type});

  @override
  State<CourseTiles> createState() => _CourseTilesState();
}

class _CourseTilesState extends State<CourseTiles> {
  @override
  Widget build(BuildContext context) {
    return widget.type == 1
        ? _Tile(course: widget.course)
        : widget.type == 2
            ? _OfferTile(course: widget.course)
            : widget.type == 3
                ? _CartTile(course: widget.course)
                : const SizedBox(); // Handle unknown type
  }
}

class _Tile extends StatefulWidget {
  final Course course;

  const _Tile({required this.course});

  @override
  State<_Tile> createState() => _TileState();
}

class _TileState extends State<_Tile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CourseDetails(course: widget.course,);
                },
              ));
            },
            child: Image.asset('assets/images/course_list_img.png'),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.course.name.length > 18
                      ? widget.course.name.substring(0, 18)
                      : widget.course.name,
                  overflow: TextOverflow.ellipsis,
                  style: MyAppFontStyles.nunito12W700DarkBlackColor,
                  softWrap: true,
                ),
                FavoriteIcon(
                  isFavorite: widget.course.isFavorite,
                ),
              ],
            ),
          ),
          Text(widget.course.author,
              style: MyAppFontStyles.nunito10W700BlackColor),
          const StarRating(),
          Text(
            "\$ ${widget.course.cost}",
            style: MyAppFontStyles.inter10W400BlackColor,
          )
        ],
      ),
    );
  }
}

class _OfferTile extends StatefulWidget {
  final Course course;

  const _OfferTile({required this.course});

  @override
  State<_OfferTile> createState() => _OfferTileState();
}

class _OfferTileState extends State<_OfferTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CourseDetails(course: widget.course,);
                      },
                    ));
                  },
                  child: SizedBox(
                    width: 98,
                    height: 69,
                    child: Image.asset(
                      'assets/images/course_list_img.png',
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.course.name.length > 23
                              ? widget.course.name.substring(0, 23)
                              : widget.course.name,
                          overflow: TextOverflow.ellipsis,
                          style: MyAppFontStyles.nunito12W700DarkBlackColor,
                          softWrap: true,
                        ),
                        Text(
                          '\$ ${widget.course.cost}',
                          style: MyAppFontStyles.inter10W400BlackColor,
                        ),
                      ],
                    ),
                    Text(
                      widget.course.author,
                      style: MyAppFontStyles.nunito10W700BlackColor,
                    ),
                    const StarRating(),
                    const SizedBox(height: 4), // Add vertical spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Advance levels",
                          style: MyAppFontStyles.inter10W400BlackColor,
                        ),
                        Text(
                          "${widget.course.hours} Hours",
                          style: MyAppFontStyles.inter10W400BlackColor,
                        ),
                        FavoriteIcon(isFavorite: widget.course.isFavorite),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}

class _CartTile extends StatefulWidget {
  final Course course;

  const _CartTile({required this.course});
  @override
  State<_CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<_CartTile> {
  final double value = 50;
  // Current value
  final double maxValue = 100;
  // Maximum value
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CourseDetails(course: widget.course,);
                      },
                    ));
                  },
                  child: SizedBox(
                    width: 108,
                    height: 86,
                    child: Image.asset(
                      'assets/images/course_list_img.png',
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.course.name.length > 23
                          ? widget.course.name.substring(0, 23)
                          : widget.course.name,
                      overflow: TextOverflow.ellipsis,
                      style: MyAppFontStyles.nunito12W700DarkBlackColor,
                      softWrap: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.course.author,
                            style: MyAppFontStyles.nunito10W700BlackColor,
                          ),
                          Text(
                            '${widget.course.hours} Hours',
                            style: MyAppFontStyles.inter10W400BlackColor,
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Progress",
                      style: MyAppFontStyles.nunito10W700BlackColor,
                    ),
                    const SizedBox(height: 4), // Add vertical spacing
                    Text(
                      "${value.toInt()} /${widget.course.chapters} Chapters",
                      style: MyAppFontStyles.openSans10W700BlackColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: LinearProgressIndicator(
                        minHeight: 3,
                        borderRadius: BorderRadius.circular(2),
                        backgroundColor: myDotGrayColor,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          value < 50 ? Colors.red : Colors.green,
                        ),
                        value: value / maxValue,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
