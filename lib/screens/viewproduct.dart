import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unimart_app/screens/ordermodel.dart';
import 'package:unimart_app/utils/databasehelper.dart';

class Viewsingleproduct extends StatefulWidget {
  String id;
  String pname;
  String price;
  String pic;
  String descr;

  Viewsingleproduct({this.id, this.pname, this.price, this.pic, this.descr});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return pscreen(
        pid: id, productnm: pname, pprice: price, photo: pic, desc: descr);
  }
}

class pscreen extends State<Viewsingleproduct> {
  Databasehelper helper=Databasehelper();
  Porder porder;

  String pid;
  String productnm;
  String pprice;
  String photo;
  String desc;

  pscreen({this.pid, this.productnm, this.pprice, this.photo, this.desc});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Color(0xffffffff),
        title: Text(
          productnm,
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  "Product name " + productnm,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                width: double.infinity,
                height: 200,
                child: Center(
                    child: CachedNetworkImage(
                  imageUrl: "https://unimart.mabnets.com/products/$photo",
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Price:KES" + pprice,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Description:" + desc,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  onPressed: () {
                    print(pid);
                    porder.prodid=pid;
                 porder.prodname=productnm;
                 porder.price=pprice;
                 _save();
                  int res=count();
                  print(res);


                  },
                  child: Text("Add to cart"),
                  color: Colors.deepOrangeAccent,
                  textColor: Colors.white,

                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
  void _save() async{
  int result;
   result=await helper.insertorder(porder);
  }
  count() async {
    var result;
    result= await helper.getcount();
   print(result);
  }
}
