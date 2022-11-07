import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const Application());
}


class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Weather App'),
    );
  }
}

