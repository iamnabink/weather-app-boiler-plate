/// Author:    Nabraj Khadka
/// Created:   17.07.2022
/// Description:

///

import 'dart:async';
import 'package:flutter/material.dart';

class ScrollingWidget extends StatefulWidget {
  final Widget child;
  final Axis scrollAxis;
  final double ratioOfBlankToScreen;

  ScrollingWidget({
    required this.child,
    this.scrollAxis = Axis.horizontal,
    this.ratioOfBlankToScreen = 0.25,
  });

  @override
  State<StatefulWidget> createState() {
    return ScrollingWidgetState();
  }
}

class ScrollingWidgetState extends State<ScrollingWidget>
    with SingleTickerProviderStateMixin {
  late ScrollController scrollController;
  late double screenWidth;
  late double screenHeight;
  double position = 0.0;
  late Timer timer;
  final double _moveDistance = 3.0;
  final int _timerRest = 100;
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      startTimer();
    });
  }

  void startTimer() {
    if (_key.currentContext != null) {
      var widgetWidth =
          _key.currentContext?.findRenderObject()?.paintBounds.size.width;
      var widgetHeight =
          _key.currentContext?.findRenderObject()?.paintBounds.size.height;

      timer = Timer.periodic(Duration(milliseconds: _timerRest), (timer) {
        var maxScrollExtent = scrollController.position.maxScrollExtent;
        var pixels = scrollController.position.pixels;
        if (pixels + _moveDistance >= maxScrollExtent) {
          if (widget.scrollAxis == Axis.horizontal) {
            position = (maxScrollExtent -
                screenWidth * widget.ratioOfBlankToScreen +
                widgetWidth!) /
                2 -
                widgetWidth +
                pixels -
                maxScrollExtent;
          } else {
            position = (maxScrollExtent -
                screenHeight * widget.ratioOfBlankToScreen +
                widgetHeight!) /
                2 -
                widgetHeight+
                pixels -
                maxScrollExtent;
          }
          scrollController.jumpTo(position);
        }
        position += _moveDistance;
        scrollController.animateTo(position,
            duration: Duration(milliseconds: _timerRest), curve: Curves.linear);
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  Widget getBothEndsChild() {
    if (widget.scrollAxis == Axis.vertical) {
      return Center(
        child: widget.child,
      );
    }
    return Center(
        child: widget.child);
  }

  Widget getCenterChild() {
    if (widget.scrollAxis == Axis.horizontal) {
      return Container(width: screenWidth * widget.ratioOfBlankToScreen);
    } else {
      return Container(height: screenHeight * widget.ratioOfBlankToScreen);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if(timer!=null) timer.cancel();

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: _key,
      scrollDirection: widget.scrollAxis,
      controller: scrollController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        getBothEndsChild(),
        getCenterChild(),
        getBothEndsChild(),
      ],
    );
  }
}