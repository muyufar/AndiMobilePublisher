import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class RatingProductView extends GetView {
  final double rating;
  final bool starHalf;

  const RatingProductView(this.rating, {this.starHalf = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          double starSize = 14.0; // Set the size of the stars

          if (index < rating.floor()) {
            return Icon(
              Ionicons.star,
              color: Colors.amber,
              size: starSize,
            );
          } else {
            if (starHalf && index == rating.floor()) {
              return Icon(
                Ionicons.star_half_outline,
                color: Colors.amber,
                size: starSize,
              );
            } else {
              return Icon(
                Ionicons.star_outline,
                color: Colors.amber,
                size: starSize,
              );
            }
          }
        },
      ),
    );
  }
}
