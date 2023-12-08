import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/style.dart';

class BookRating extends StatelessWidget {
    BookRating({super.key, required this.rating, required this.count, required MainAxisAlignment mainAxisAlignment});
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rating.toString(),
          style: Style.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '($count',
          style: Style.textStyle14.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
