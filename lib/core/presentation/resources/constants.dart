import 'package:flutter/material.dart';

BoxDecoration kBoxDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.15),
      blurRadius: 8,
      spreadRadius: 6,
      offset: const Offset(0, 0),
    ),
  ],
);

const kAppName = 'Weather Boilerplate App';
const kHelpPageWelcomeMsg = 'We show weather for you';
const kHelpPageAutoRedirectMsg = 'Auto-redirecting in..';
