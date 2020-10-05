import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({@required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgUrl,
            child: Container(
              height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imgUrl,fit: BoxFit.cover,)),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,

              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    _save();

                    Navigator.pop(context);
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0Xff1C1B1B).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30),

                        ),
                        width: MediaQuery.of(context).size.width/2,


                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white54, width: 1),
                            gradient: LinearGradient(
                                colors: [
                                  Color(0X36FFFFFF),
                                  Color(0X0FFFFFFF)
                                ]
                            )
                        ),
                        child:Column(
                          children: <Widget>[
                            Text('Set Wallpaper',style: TextStyle(fontSize: 16,color: Colors.white70)),
                            Text('Image will be stored in gallery',style: TextStyle(fontSize: 12,color: Colors.white70),)
                          ],
                        ),
                      ),

                    ],
                  ),

                ),
                SizedBox(height: 16,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: Text("Cancel",style: TextStyle(color: Colors.white),)),
                SizedBox(height: 70,)
              ],
            ),
          )
        ],
      ),
    );

  }
  _save() async {
    if(Platform.isAndroid) {
      await _askPermission();
    }
    var response = await Dio().get(widget.imgUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data),
    quality: 100);
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      /*Map<PermissionGroup, PermissionStatus> permissions =
          */await PermissionHandler()
          .requestPermissions([PermissionGroup.photos]);
    } else {
      /* PermissionStatus permission = */await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
  }

}
