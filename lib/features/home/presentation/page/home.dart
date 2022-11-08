import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moru_weather/core/presentation/resources/colors.dart';
import 'package:moru_weather/core/presentation/resources/size_constants.dart';
import 'package:moru_weather/core/presentation/widget/cached_network_image_builder.dart';
import 'package:moru_weather/core/presentation/widget/network_error_view.dart';
import 'package:moru_weather/features/home/data/entity/weather.dart';
import 'package:moru_weather/features/home/di/di.dart';
import 'package:moru_weather/features/home/presentation/widgets/shimmer_view.dart';

import '../../../../core/data/remote/network_exceptions.dart';
import '../../../../core/presentation/widget/buttons.dart';
import '../../../../core/presentation/widget/textfields.dart';
import '../widgets/app_bar.dart';

class HomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherInfoNotifier);
    // useEffect(() {
    //   ref.read(weatherInfoNotifier.notifier).getWeatherInfoByLocation(city: 'Kathmandu');
    //   return () {};
    // },[]);

    return Scaffold(
      appBar: AppBarHome(),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
        child: Column(
          children: [
            _SearchBarView(),
            state.when(
                data: (data) {
                  return _WeatherInfoView(data);
                },
                error: (error) {
                  return NetworkErrorView(
                      message: NetworkExceptions.getErrorMessage(
                          error as NetworkExceptions));
                },
                loading: () => const WeatherInfoShimmerView(),
                idle: () {
                  return const SizedBox.shrink();
                }),
          ],
        ),
      ),
    );
  }
}

class _WeatherInfoView extends StatelessWidget {
  final Weather info;

  const _WeatherInfoView(
    this.info, {
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
              SBC.sW,
              Text(
                '${info.location?.name}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          SBC.xLH,
          Text(
            '${info.location?.localtime}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SBC.xxLH,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 50,
                  child: CustomCachedNetworkImage(
                      'http://${info.current?.condition?.icon?.substring(2)}')),
              SBC.sW,
              Text(
                '${info.current?.tempC}°C',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 36),
              ),
            ],
          ),
          SBC.xLH,
          Text(
            'Feels like ${info.current?.feelsLikeTempC}° C',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontSize: 16, color: AppColors.colorBlack(1)),
          ),
          SBC.xLH,
          Text(
            '${info.current?.condition?.text}',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontSize: 16, color: AppColors.colorBlack(1)),
          ),
        ],
      ),
    );
  }
}

class _SearchBarView extends HookConsumerWidget {
  _SearchBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _textController = useTextEditingController();
    final queryString = useState('');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            child: Container(
          width: 250,
          child: PrimaryTextField(
            controller: _textController,
            onSaved: (_) {},
            onChanged: (String? val) {
              if (val != null) {
                queryString.value = val;
              }
            },
            hintTxt: 'Enter City Name',
          ),
        )),
        // SBC.mW,
        PrimaryButton(
          onPressed: () {
            // queryString = queryString.value; // save/update this value locally
            FocusScope.of(context).unfocus();
            ref.read(weatherInfoNotifier.notifier).getWeatherInfoByLocation(city: _textController.text);
          },
          title: '${queryString.value.isEmpty ? 'Save' : 'Update'}',
          height: 48,
          width: 80,
        ),
      ],
    );
  }
}
