import 'package:flutter/material.dart';
import 'package:wallhub/Model/About%20Us.dart';
import 'package:wallhub/Model/Category_model.dart';
import 'package:wallhub/dataa/data.dart';
import 'package:wallhub/widget/widget.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  List<CategoriesModel> categories = new List();

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: GridView.count(
              shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 6.0,
              crossAxisSpacing: 6,

              // ignore: missing_return
              children: List.generate(categories.length, (index) {
                return CategoriesTile(
                    imgUrl: categories[index].imgUrl, title: categories[index].categorieName);
              }),
            ),
          ),
        ),
      ),
    );
  //   return Scaffold(
  //     body: SingleChildScrollView(
  //       physics: ClampingScrollPhysics(),
  //       child: Container(
  //         child: Column(
  //           children: <Widget>[
  //             GridView.count(
  //               shrinkWrap: true,
  //                 physics: ClampingScrollPhysics(),
  //                 crossAxisCount: 2,
  //                 crossAxisSpacing: 2,
  //                 mainAxisSpacing: 4,
  //
  //                 // itemCount: categories.length,
  //                 // itemBuilder: (context, index){
  //                 // return CategoriesTile(
  //                 //     imgUrl: categories[index].imgUrl, title: categories[index].categorieName);
  //              },
  // )
  //
  //
  //           ],
  //         ),
  //       ),
  //     ),
  //
  //   );
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
              child: Image.network(imgUrl,height: 300,width: 150,fit: BoxFit.cover,)),
          Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            height: 300,width: 150,
            child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16,letterSpacing: 1.0),),

          )
        ],
      ),
    );
  }
}



