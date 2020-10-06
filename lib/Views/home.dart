import 'dart:convert';
import 'dart:io';
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
import 'package:admob_flutter/admob_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AdmobBannerSize bannerSize;

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

    bannerSize = AdmobBannerSize.BANNER;

    getTrendingWallpapers();
    getnewWallpapers();
    get4kgWallpapers();
    getpopularWallpapers();
    getletestWallpapers();

    super.initState();
  }

  void handleEvent(AdmobAdEvent event, Map<String, dynamic> args, String adType){

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

              // //TODO: Banner add start here
              // Container(
              // //  height: 150,
              //     child: PopupMenuButton(
              //     initialValue: bannerSize,
              //     child: Center(
              //       child: Text(
              //         'Banner size',
              //         style: TextStyle(
              //             fontWeight: FontWeight.w500,
              //             color: Colors.white),
              //       ),
              //     ),
              //     offset: Offset(0, 20),
              //     onSelected: (AdmobBannerSize newSize) {
              //       setState(() {
              //         bannerSize = newSize;
              //       });
              //     },
              //     itemBuilder:
              //     (BuildContext context) => <PopupMenuEntry<AdmobBannerSize>>[
              //       PopupMenuItem(
              //         value: AdmobBannerSize.LARGE_BANNER,
              //         child: Text('LARGE_BANNER'),
              //       ),
              //     ]
              // )),
              // Container(
              //   child: AdmobBanner(
              //     adUnitId: getBannerAdUnitId(),
              //     adSize: bannerSize,
              //     listener: (AdmobAdEvent event,
              //         Map<String, dynamic> args) {
              //       handleEvent(event, args, 'LARGE_BANNER');
              //     },
              //     onBannerCreated:
              //         (AdmobBannerController controller) {
              //       // Dispose is called automatically for you when Flutter removes the banner from the widget tree.
              //       // Normally you don't need to worry about disposing this yourself, it's handled.
              //       // If you need direct access to dispose, this is your guy!
              //       // controller.dispose();
              //     },
              //   ),
              // ),
              // //TODO: Banner add End here

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
              //WallpaperList(kwallpapers, context),
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
              //TODO: Banner add start here
              Container(
                //  height: 150,
                  child: PopupMenuButton(
                      initialValue: bannerSize,
                      child: Center(
                        child: Text(
                          'Banner size',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      offset: Offset(0, 20),
                      onSelected: (AdmobBannerSize newSize) {
                        setState(() {
                          bannerSize = newSize;
                        });
                      },
                      itemBuilder:
                          (BuildContext context) => <PopupMenuEntry<AdmobBannerSize>>[
                        PopupMenuItem(
                          value: AdmobBannerSize.LARGE_BANNER,
                          child: Text('LARGE_BANNER'),
                        ),
                      ]
                  )),
              Container(
                child: AdmobBanner(
                  adUnitId: getBannerAdUnitId(),
                  adSize: bannerSize,
                  listener: (AdmobAdEvent event,
                      Map<String, dynamic> args) {
                    handleEvent(event, args, 'LARGE_BANNER');
                  },
                  onBannerCreated:
                      (AdmobBannerController controller) {
                    // Dispose is called automatically for you when Flutter removes the banner from the widget tree.
                    // Normally you don't need to worry about disposing this yourself, it's handled.
                    // If you need direct access to dispose, this is your guy!
                    // controller.dispose();
                  },
                ),
              ),
              //TODO: Banner add End here
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
              //TODO: Banner add start here
              Container(
                //  height: 150,
                  child: PopupMenuButton(
                      initialValue: bannerSize,
                      child: Center(
                        child: Text(
                          'Banner size',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      offset: Offset(0, 20),
                      onSelected: (AdmobBannerSize newSize) {
                        setState(() {
                          bannerSize = newSize;
                        });
                      },
                      itemBuilder:
                          (BuildContext context) => <PopupMenuEntry<AdmobBannerSize>>[
                            PopupMenuItem(
                              value: AdmobBannerSize.MEDIUM_RECTANGLE,
                              child: Text('MEDIUM_RECTANGLE'),
                            ),
                      ]
                  )),
              Container(
                child: AdmobBanner(
                  adUnitId: getBannerAdUnitId(),
                  adSize: bannerSize,
                  listener: (AdmobAdEvent event,
                      Map<String, dynamic> args) {
                    handleEvent(event, args, 'MEDIUM_RECTANGLE');
                  },
                  onBannerCreated:
                      (AdmobBannerController controller) {
                    // Dispose is called automatically for you when Flutter removes the banner from the widget tree.
                    // Normally you don't need to worry about disposing this yourself, it's handled.
                    // If you need direct access to dispose, this is your guy!
                    // controller.dispose();
                  },
                ),
              ),
              //TODO: Banner add End here
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
              //TODO: Banner add start here
              Container(
                //  height: 150,
                  child: PopupMenuButton(
                      initialValue: bannerSize,
                      child: Center(
                        child: Text(
                          'Banner size',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      offset: Offset(0, 20),
                      onSelected: (AdmobBannerSize newSize) {
                        setState(() {
                          bannerSize = newSize;
                        });
                      },
                      itemBuilder:
                          (BuildContext context) => <PopupMenuEntry<AdmobBannerSize>>[
                        PopupMenuItem(
                          value: AdmobBannerSize.LARGE_BANNER,
                          child: Text('LARGE_BANNER'),
                        ),
                      ]
                  )),
              Container(
                child: AdmobBanner(
                  adUnitId: getBannerAdUnitId(),
                  adSize: bannerSize,
                  listener: (AdmobAdEvent event,
                      Map<String, dynamic> args) {
                    handleEvent(event, args, 'LARGE_BANNER');
                  },
                  onBannerCreated:
                      (AdmobBannerController controller) {
                    // Dispose is called automatically for you when Flutter removes the banner from the widget tree.
                    // Normally you don't need to worry about disposing this yourself, it's handled.
                    // If you need direct access to dispose, this is your guy!
                    // controller.dispose();
                  },
                ),
              ),
              //TODO: Banner add End here
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
              //TODO: Banner add start here
              Container(
                //  height: 150,
                  child: PopupMenuButton(
                      initialValue: bannerSize,
                      child: Center(
                        child: Text(
                          'Banner size',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      offset: Offset(0, 20),
                      onSelected: (AdmobBannerSize newSize) {
                        setState(() {
                          bannerSize = newSize;
                        });
                      },
                      itemBuilder:
                          (BuildContext context) => <PopupMenuEntry<AdmobBannerSize>>[
                        PopupMenuItem(
                          value: AdmobBannerSize.LARGE_BANNER,
                          child: Text('LARGE_BANNER'),
                        ),
                      ]
                  )),
              Container(
                child: AdmobBanner(
                  adUnitId: getBannerAdUnitId(),
                  adSize: bannerSize,
                  listener: (AdmobAdEvent event,
                      Map<String, dynamic> args) {
                    handleEvent(event, args, 'LARGE_BANNER');
                  },
                  onBannerCreated:
                      (AdmobBannerController controller) {
                    // Dispose is called automatically for you when Flutter removes the banner from the widget tree.
                    // Normally you don't need to worry about disposing this yourself, it's handled.
                    // If you need direct access to dispose, this is your guy!
                    // controller.dispose();
                  },
                ),
              ),
              //TODO: Banner add End here
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

String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-7270315510450456/1230276913';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/6300978111';
  }
  return null;
}
