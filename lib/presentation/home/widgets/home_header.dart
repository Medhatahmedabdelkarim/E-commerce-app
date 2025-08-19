import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '  $title',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See more',
            style: TextStyle(
              color: EColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}