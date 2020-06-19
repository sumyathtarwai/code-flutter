import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridBarImage extends StatelessWidget {
  final String imagePath;
  const GridBarImage({
    Key key,
    @required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 5),
        child: CachedNetworkImage(
          width: double.infinity,
          imageUrl: imagePath,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.black26,
            highlightColor: Colors.white,
            child: Container(
              width: double.infinity,
              color: Colors.black,
            ),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
