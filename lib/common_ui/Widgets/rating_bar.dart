import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingsBar extends StatelessWidget {
  const RatingsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ratingWidget: RatingWidget(
        full: Icon(Icons.star, color: Colors.amber),
        half: Icon(Icons.star, color: Colors.amber),
        empty: Icon(Icons.star, color: Colors.grey),
      ),
      maxRating: 5,
      minRating: 1,
      onRatingUpdate: (value) => print(value),
    );
  }
}
