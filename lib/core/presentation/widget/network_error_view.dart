import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moru_weather/core/presentation/resources/colors.dart';

import '../resources/ui_assets.dart';

class NetworkErrorView extends StatelessWidget {
  final String? message;
  final bool handleError;
  final Function? onErrorFunction;

  NetworkErrorView(
      {this.message, this.handleError = false, this.onErrorFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 140,
          width: 110,
          child: SvgPicture.asset(
            UIAssets.getImage('empty_view.svg'),
            // animation:'Alarm',
          ),
        ),

        Center(
            child: Text(
          message ?? 'Oooops ! ..',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1)),
        // if (handleError==true) Center(child: ElevatedButton(onPressed:onErrorFunction,child: const Text('Retry Connection'),)) else Container(),
      ],
    );
  }
}
