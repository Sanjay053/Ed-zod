import 'package:ed_zod/themes/fornstyle_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRating extends StatefulWidget {
  const StarRating({super.key});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  double totalRating = 4.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(totalRating.toStringAsFixed(1),
            style: MyAppFontStyles.nunito10W700YellowColor),
        const SizedBox(width: 4),
        RatingBar.builder(
          itemSize: 12,
          wrapAlignment: WrapAlignment.spaceBetween,
          initialRating: 4.0, // Set the initial rating value
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              totalRating = rating; // Update the total rating value
            });
          },
        ),
      ],
    );
  }
}
