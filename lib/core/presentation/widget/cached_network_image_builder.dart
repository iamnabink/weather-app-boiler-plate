import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moru_weather/core/presentation/widget/buttons.dart';
import 'package:moru_weather/core/presentation/widget/shimmer_effect.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String? url;
  final BoxFit? fit;

  const CustomCachedNetworkImage(this.url, {this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? '',
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const CustomCupertinoIndicator(),
      errorWidget: (context, url, error) => const CustomCupertinoIndicator(),
    );
  }
}
