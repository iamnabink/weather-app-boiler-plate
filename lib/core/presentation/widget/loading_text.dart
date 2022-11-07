// library loading_text;
//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:quiver/iterables.dart';
//
// class LoadingText extends StatefulWidget {
//   final String text;
//   final String dots;
//   final TextStyle textStyle;
//   final Duration? duration;
//
//   LoadingText(
//       {Key? key,
//       this.text = "Loading",
//       this.dots = ".",
//       Duration? duration,
//       required this.textStyle})
//       : duration = duration ?? const Duration(milliseconds: 1000),
//         super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return LoadingTextState();
//   }
// }
//
// class LoadingTextState extends State<LoadingText> {
//   static final int _dotsNum = 3;
//   int _count = 0;
//
//   LoadingTextState();
//
//   @override
//   void initState() {
//     super.initState();
//
//     Timer.periodic(widget.duration!, (timer) {
//       setState(() {
//         _count += 1;
//         if (_count > 3) _count = 0;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final children = <Widget>[];
//     final textView = Text(widget.text, style: widget.textStyle);
//
//     children.add(textView);
//
//     range(LoadingTextState._dotsNum).forEach((i) {
//       var textStyle = widget.textStyle;
//
//       if (i >= _count) {
//         textStyle = textStyle.copyWith(color: Colors.transparent);
//       }
//       final dot = Text(widget.dots, style: textStyle);
//       children.add(dot);
//     });
//
//     return Flex(
//       key: widget.key,
//       children: children,
//       mainAxisSize: MainAxisSize.min,
//       direction: Axis.horizontal,
//     );
//   }
// }
