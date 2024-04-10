import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  final bool isFavorite;
  const FavoriteIcon({super.key, this.isFavorite = false});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  late bool _isFavorite = widget.isFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
      child: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: _isFavorite ? Colors.red : myFavIconGrayBorderColor,
        size: 14,
      ),
    );
  }
}
