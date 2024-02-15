// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:d_luscious/core/constant/app_image.dart';
import 'package:d_luscious/core/constant/app_string.dart';

class SingleCircleWidgetShimmer extends StatelessWidget {
  final double? radius;
  final double fontSize;
  final String typeName;

  const SingleCircleWidgetShimmer({
    Key? key,
    this.radius,
    this.fontSize = 20,
    required this.typeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: radius,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              filterQuality: FilterQuality.none,
              imageUrl: "", // Empty URL for shimmer
              placeholder: (ctx, url) => Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey,
                child: CircleAvatar(
                  radius: radius,
                ),
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: radius,
                backgroundImage: const AssetImage(ImageAsset.icAppLogo),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey,
            child: Text(
              AppString.appName,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: "chewy",
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
