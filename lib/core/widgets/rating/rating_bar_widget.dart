import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating)?;

const starPoints = 5;

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
    required this.rating,
    this.iconsSize = 20,
    this.activeRatingColor = const Color(0xff34C759),
    this.inactiveRatingColor = const Color(0xffDBD8E3),
    this.onRatingChanged,
    this.isAnimate = false,
  });

  final double rating;
  final double iconsSize;
  final Color activeRatingColor;
  final Color inactiveRatingColor;
  final RatingChangeCallback onRatingChanged;
  final bool isAnimate;

  @override
  Widget build(BuildContext context) {
    if (isAnimate) {
      return TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        tween: Tween<double>(
          begin: 0,
          end: rating,
        ),
        builder: (_, value, __) => Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            5,
            (index) => buildStar(index, value),
          ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => buildStar(index, rating),
      ),
    );
  }

  Widget buildStar(int index, double rating) {
    Widget icon;
    final double present = rating - index;
    icon = ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => LinearGradient(
        colors: [activeRatingColor, inactiveRatingColor],
        stops: [present, present],
      ).createShader(bounds),
      child: Icon(
        Icons.star,
        size: iconsSize,
      ),
    );

    return InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }
}
