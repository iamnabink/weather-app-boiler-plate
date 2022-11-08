import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moru_weather/core/presentation/widget/buttons.dart';
import 'package:moru_weather/core/presentation/widget/shimmer_effect.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String url;

  const CustomCachedNetworkImage(this.url,);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const CustomCupertinoIndicator(),
      errorWidget: (context, url, error) => const CustomCupertinoIndicator(),
    );
  }
}
