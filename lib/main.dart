import 'package:flutter/material.dart';
import 'package:wallhub/Views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WallpaperHub',
      theme: ThemeData(
      //  primarySwatch: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: Home(),
    );
  }
}
