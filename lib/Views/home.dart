import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallhub/Model/About%20Us.dart';
import 'package:wallhub/Model/Category_model.dart';
import 'package:wallhub/Model/Wallpaper_model.dart';
import 'package:wallhub/Views/CATELIST.dart';
import 'package:wallhub/dataa/data.dart';
import 'package:wallhub/view/image_view.dart';
import 'package:wallhub/widget/widget.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoriesModel> categories = new List();
  List<PhotosModel> wallpapers = new List();

  List<PhotosModel> newwallpapers = new List();
  List<PhotosModel> kwallpapers = new List();
  List<PhotosModel> popularwallpapers = new List();
  List<PhotosModel> letestwallpapers = new List();


  getTrendingWallpapers() async {

    var response = await http.get("https://api.pexels.com/v1/search?query=4k&per_page=12",
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

  getnewWallpapers() async {

    var response = await http.get("https://api.pexels.com/v1/search?query=hd&per_page=12",
        headers: {
          "Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      PhotosModel photosModel = new PhotosModel();
      photosModel = PhotosModel.fromMap(element);
      newwallpapers.add(photosModel);

    });
    setState(() {

    });
  }
  get4kgWallpapers() async {

    var response = await http.get("https://api.pexels.com/v1/search?query=new&per_page=12",
        headers: {
          "Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      PhotosModel photosModel = new PhotosModel();
      photosModel = PhotosModel.fromMap(element);
      kwallpapers.add(photosModel);

    });
    setState(() {

    });
  }
  getpopularWallpapers() async {

    var response = await http.get("https://api.pexels.com/v1/search?query=art&per_page=12",
        headers: {
          "Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      PhotosModel photosModel = new PhotosModel();
      photosModel = PhotosModel.fromMap(element);
      popularwallpapers.add(photosModel);

    });
    setState(() {

    });
  }
  getletestWallpapers() async {

    var response = await http.get("https://api.pexels.com/v1/search?query=outdoors&per_page=12",
        headers: {
          "Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      PhotosModel photosModel = new PhotosModel();
      photosModel = PhotosModel.fromMap(element);
      letestwallpapers.add(photosModel);

    });
    setState(() {

    });
  }


  @override
  void initState() {
    categories = getCategories();

    getTrendingWallpapers();
    getnewWallpapers();
    get4kgWallpapers();
    getpopularWallpapers();
    getletestWallpapers();

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
                        fontSize: 14,
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
                              fontSize: 14,
                              letterSpacing: 1.5,
                              fontFamily: 'Lobster'),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text('Trending',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),),
                  ),
                ],
              ),
              SizedBox(height: 8,),

               WallpaperList(wallpapers, context),

              SizedBox(
                height: 16,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategorieScreen(
                                categorie: "4k",
                              )));
                    },
                    child: Padding(

                      padding: const EdgeInsets.only(right:20.0),
                      child: Text('More...',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text('Hot',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              WallpaperList(newwallpapers, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategorieScreen(
                                categorie: "hd",
                              )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right:20.0),
                      child: Text('More...',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text('Popular',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              WallpaperList(kwallpapers, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:20.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategorieScreen(
                                  categorie: "new",
                                )));
                      },
                      child: Text('More...',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text('Art',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              WallpaperList(popularwallpapers, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:20.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategorieScreen(
                                  categorie: "art",
                                )));
                      },
                      child: Text('More...',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text('Latest',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              WallpaperList(letestwallpapers, context),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:20.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategorieScreen(
                                  categorie: "outdoor",
                                )));
                      },
                      child: Text('More...',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
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
          GestureDetector(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(
                 builder: (context) => ImageView()
             ));
           },
            child: Hero(
              tag: imgUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                  child: Image.network(imgUrl,height: 60,width: 100,fit: BoxFit.cover,)),
            ),
          ),
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

