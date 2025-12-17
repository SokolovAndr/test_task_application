import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ProductItemRatingWidget extends StatelessWidget {
  const ProductItemRatingWidget({super.key, required this.rate});

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarRating(
          size: 20.0,
          rating: rate,
          color: Colors.orange,
          borderColor: Colors.grey,
          allowHalfRating: true,

          onRatingChanged: (rate) => {},
        ),
        SizedBox(width: 8),
        Text(rate.toString()),
      ],
    );
  }
}
