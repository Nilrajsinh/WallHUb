import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallhub/Model/Wallpaper_model.dart';
import 'package:wallhub/view/image_view.dart';


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
        // scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),

        crossAxisCount: 2,
      childAspectRatio: 0.6,// if you want horizonatl use 1.6
       mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((e){
        return GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ImageView(imgUrl: e.src.portrait,)
                      
              ));
            },
            child: Container(
             child: Hero(
               tag: Image.network(e.src.portrait),
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(16),
                   child: Image.network(e.src.portrait,fit: BoxFit.cover,)),

             ),



            ),
          ),
        );
      }).toList(),
    ),
  );

}