import 'package:flutter/material.dart';
import 'package:moru_weather/core/presentation/resources/size_constants.dart';
import 'package:moru_weather/core/presentation/widget/cached_network_image_builder.dart';

import '../../../../core/presentation/widget/shimmer_effect.dart';

class WeatherInfoShimmerView extends StatelessWidget {
  const WeatherInfoShimmerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 24,
              ),
              SBC.mW,
              ShimmerWidget(
                height: 20,
                width: 100,
              ),
            ],
          ),
          SBC.xLH,
          ShimmerWidget(
            height: 20,
            width: 100,
          ),
          SBC.xxLH,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 36, child: CustomCachedNetworkImage('')),
              SBC.mW,
              ShimmerWidget(
                height: 20,
                width: 100,
              ),
            ],
          ),
          SBC.xLH,
          ShimmerWidget(
            height: 20,
            width: 100,
          ),
          SBC.xLH,
          ShimmerWidget(
            height: 20,
            width: 100,
          ),
        ],
      ),
    );
  }
}
