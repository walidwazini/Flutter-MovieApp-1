import 'package:flutter/material.dart';
import 'package:movie_app_1/widgets/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App ver.1',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MovieHomePage(),
    );
  }
}
