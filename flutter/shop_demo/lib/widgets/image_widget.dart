import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageWidget extends StatelessWidget {
  final String imagePath;

  final BorderRadius borderRadius;
  const ImageWidget({
    Key key,
    @required this.imagePath,
    @required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        child: CachedNetworkImage(
          width: double.infinity,
          imageUrl: imagePath,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey.shade400,
            enabled: true,
            child: Container(
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
