import 'package:flutter/material.dart';
import 'package:moru_weather/core/presentation/resources/size_constants.dart';
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
              const ShimmerWidget(
                height: 24,
                width: 24,
              ),
              SBC.mW,
              const ShimmerWidget(
                height: 20,
                width: 100,
              ),
            ],
          ),
          SBC.xxLH,
          const ShimmerWidget(
            height: 20,
            width: 150,
          ),
          SBC.xxLH,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ShimmerWidget(
                height: 36,
                width: 36,
              ),
              SBC.mW,
              const ShimmerWidget(
                height: 40,
                width: 120,
              ),
            ],
          ),
          SBC.xLH,
          const ShimmerWidget(
            height: 20,
            width: 150,
          ),
          SBC.xLH,
          const ShimmerWidget(
            height: 20,
            width: 100,
          ),
        ],
      ),
    );
  }
}
