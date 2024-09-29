import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:flutter/material.dart';

class TvShowList extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  const TvShowList({Key? key, required this.imagePath, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: CachedNetworkImage(
            imageUrl: '$BASE_IMAGE_URL${imagePath}',
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
