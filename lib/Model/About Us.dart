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
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context),
           // onPressed:() => (context),
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: BrandName(),
          elevation: 0.0,
          actions: <Widget>[

          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right:8.0,top: 8),
              child: Text('About Us', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: 2,
                fontFamily: 'Lobster',
              ),),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Thousands of wallpaper on you single tap,Our goal is to'
                  ' serve amazing Wallpapers to the people all across the world. Bring your screen to '
                  'life with exclusive Wallpapers delivered to you by Ebrious. Each wallpaper is a real '
                  'masterpiece ',
              style: TextStyle(
                // color: Color(0xffFC766AFF),
                letterSpacing: 0.5,
               // fontFamily: 'Lobster',
                fontSize: 18,
                fontWeight: FontWeight.bold

              ),
                textAlign: TextAlign.justify,
              ),
            ),
           Spacer(),
           Column(

             children: [
               Padding(
                 padding: const EdgeInsets.only(bottom:25.0),
                 child: Image.asset("asset/Original on Transparent copy.png",
                 height:120,),
               ),
             ],
           ) //
          ],
        ),

      ),
    );
  }
}
