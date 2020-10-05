import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallhub/Model/Wallpaper_model.dart';
import 'package:wallhub/dataa/data.dart';
import 'package:wallhub/widget/widget.dart';


class CategorieScreen extends StatefulWidget {
  final String categorie;

  CategorieScreen({@required this.categorie});

  @override
  _CategorieScreenState createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  List<PhotosModel> photos = new List();

  getCategorieWallpaper() async {
    await http.get(
        "https://api.pexels.com/v1/search?query=${widget.categorie}&per_page=80&page=1",
        headers: {"Authorization": apiKey}).then((value) {
      //print(value.body);

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //print(element);
        PhotosModel photosModel = new PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
        //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
      });

      setState(() {});
    });
  }

  @override
  void initState() {
    getCategorieWallpaper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: WallpaperList(photos, context)
        ,
      ),
    );
  }
}