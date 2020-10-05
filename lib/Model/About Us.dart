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
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: BrandName(),
          elevation: 0.0,
          actions: <Widget>[

          ],
        ),
        body: Text('About Us', style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
