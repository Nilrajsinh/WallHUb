import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallhub/widget/widget.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: BrandName(),
        ),
        body: Text('About Us', style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
