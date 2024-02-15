// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:d_luscious/features/home/widget/single_circle_shimmer_widget.dart';

class CommunListShimmerWidget extends StatelessWidget {
  final double fontSize;
  final double? radius;
  final String? title;
  final double? height;
  const CommunListShimmerWidget({
    Key? key,
    required this.fontSize,
    this.radius,
    this.title,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 120,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: 5, // Adjust the number of shimmer items
          itemBuilder: (context, index) {
            return SingleCircleWidgetShimmer(
              typeName: title ?? "",
              radius: radius ?? 35,
              fontSize: fontSize,
            ); // Create a shimmer widget
          },
        ),
      ),
    );
  }
}
