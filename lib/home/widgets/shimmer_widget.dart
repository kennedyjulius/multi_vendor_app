import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double shimmerWidth;
  final double shimmerHeight;
  final double shimmerRadius;

  const ShimmerWidget({
    super.key,
    required this.shimmerWidth,
    required this.shimmerHeight,
    required this.shimmerRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: shimmerWidth,
      height: shimmerHeight,
      padding: const EdgeInsets.only(
        right: 12,
        top: 8.0,
      ),
      child: _buildShimmerLine(
        height: shimmerHeight - 20,
        width: shimmerWidth - 15,
        radius: shimmerRadius - 10,
      ),
    );
  }

  Widget _buildShimmerLine({
    required double height,
    required double width,
    required double radius,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: kSecondaryLight,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
