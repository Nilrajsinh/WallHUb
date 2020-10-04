import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallhub/Model/Wallpaper_model.dart';

Widget BrandName(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('Wallpapers-', style: TextStyle(
          color: Color(0xffFCA5F1),
          letterSpacing: 1.5,
          fontFamily: 'Lobster',
          fontSize: 30.0
      ),),
      Text('Club', style: TextStyle(
          color: Color(0xffFC766AFF),
          letterSpacing: 1.5,
          fontFamily: 'Lobster',
          fontSize: 30.0
      ),)
    ],
  );
}

Widget WallpaperList(List<PhotosModel> wallpapers, context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
        physics: ClampingScrollPhysics(),

        crossAxisCount: 2,
      childAspectRatio: 0.6,// if you want horizonatl use 1.6
       mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((e){
        return GridTile(
          child: Container(
           child: ClipRRect(
             borderRadius: BorderRadius.circular(16),
               child: Image.network(e.src.portrait,fit: BoxFit.cover,)),

          ),
        );
      }).toList(),
    ),
  );
}