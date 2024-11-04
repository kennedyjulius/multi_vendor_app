import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShimmerWidget extends StatelessWidget {
  final double shimmerWidth;
  final double shimmerHeight;
  final double shimmerRadius;

  const ShimmerWidget({
    Key? key,
    required this.shimmerWidth,
    required this.shimmerHeight,
    required this.shimmerRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: shimmerWidth,
      height: shimmerHeight,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey,
        borderRadius: BorderRadius.circular(shimmerRadius),
      ),
    );
  }
}
