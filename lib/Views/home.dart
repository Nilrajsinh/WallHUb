import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallhub/Model/About%20Us.dart';
import 'package:wallhub/Model/Category_model.dart';
import 'package:wallhub/Model/Wallpaper_model.dart';
import 'package:wallhub/dataa/data.dart';
import 'package:wallhub/widget/widget.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoriesModel> categories = new List();
  List<PhotosModel> wallpapers = new List();


  getTrendingWallpapers() async {

    var response = await http.get("https://api.pexels.com/v1/search?query=popular&per_page=80",
    headers: {
      "Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      PhotosModel photosModel = new PhotosModel();
      photosModel = PhotosModel.fromMap(element);
      wallpapers.add(photosModel);

    });
    setState(() {

    });
  }

  @override
  void initState() {
    categories = getCategories();

    getTrendingWallpapers();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                margin: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextField(

                      decoration: InputDecoration(
                        hintText: 'Search here',
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  //TODO: Search start from 1 hour 36 min , Left here

                  Icon(Icons.search),
                ],),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Made By ",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        letterSpacing: 1.5,
                        fontFamily: 'Lobster'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutUs(

                              )));
                    },
                    child: Container(
                        child: Text(
                          "Ebrious",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              letterSpacing: 1.5,
                              fontFamily: 'Lobster'),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              // Container(
              //   height: 80,
              //   child: ListView.builder(
              //     padding: EdgeInsets.symmetric(horizontal: 24),
              //     itemCount: categories.length,
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (BuildContext context, int index) {
              //       // wallpapers[index].src.portrait;
              //       return CategoriesTile(
              //         title: categories[index].categorieName,
              //         imgUrl: categories[index].imgUrl,
              //       );
              //     },
              //
              //   ),
              // ),
              WallpaperList(wallpapers, context)
            ],
          ),
        ),
      ),
    );
  }
}


class CategoriesTile extends StatelessWidget {

 final String imgUrl,title;
CategoriesTile({@required this.imgUrl,@required this.title});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
              child: Image.network(imgUrl,height: 60,width: 100,fit: BoxFit.cover,)),
          Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
          height: 60,width: 100,
            child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16,letterSpacing: 1.0),),

          )
        ],
      ),
    );
  }
}

