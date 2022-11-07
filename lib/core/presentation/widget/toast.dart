import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  final FToast _fToast = FToast();

  void custom(BuildContext context, IconData iconData,
      {required String toastMessage, Color? color}) {
    _fToast.init(context);
    final Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color ?? Colors.greenAccent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            toastMessage,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.apply(color: Colors.white),
          ),
        ],
      ),
    );

    _fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  static void success(String message, {Color? color}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: color ?? Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void error(String message, {Color? color, double? opacity}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: color ?? Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void warning(String message, {Color? color}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: color ?? Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
