import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assests.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
   
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
fit: BoxFit.fill,
/*           placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ), */
          errorWidget: (context, url, error) => Icon(Icons.error),
          /*  decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(AssetsData.testImage)

              )


          ), */
        ),
      ),
    );
  }
}
