import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
/*import 'package:data_connection_checker/data_connection_checker.dart';*/
import 'package:cached_network_image/cached_network_image.dart';
import 'package:unimart_app/screens/model.dart';
import 'package:unimart_app/screens/viewproduct.dart';

//import 'package:connectivity/connectivity.dart';

class Categoryitems extends StatefulWidget {
  /*const Categoryitems({Key key}): super(key:key);*/
  String categorytobesent;

  Categoryitems({this.categorytobesent});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return categoryitemscreen(categorytobesent);
  }
}

class categoryitemscreen extends State<Categoryitems> {
  String categorytobesent;

  categoryitemscreen(this.categorytobesent);

  Future<List<Product>> getData() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final response = await http.post(
            "https://unimart.mabnets.com/android/loadfromcategories.php",
            body: {"category": categorytobesent});

        var jsonData= json.decode(response.body);
        List<Product> Listof=[];
        print(jsonData);
        for (var i in jsonData){
          Product product=new Product(i["id"],i["product"], i["photo"], i["category"],i["cprice"],i["iprice"],i["description"]);
          Listof.add(product);
        }
        return Listof;

      }
    }  on SocketException catch (_) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No internet'),
            content: Text('check your internet connection'),
            actions: <Widget>[
              new FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  child: Text(
                      'ok'
                  ))
            ],
          ));
    }
  }






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
          categorytobesent,
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder<List<Product>>(
            future: getData(),
            builder: (ctx, ss) {

              if (ss.hasError) {
                print("error");
                return InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.refresh),
                        Text('Something went wrong Tap to retry'),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        getData();
                      });
                    });
              }

              if (ss.hasData) {
                return Items(listx:ss.data);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  List<Product> listx;


  Items({this.listx});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        itemCount:listx == null ? 0 :listx.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (ctx, i) {
          return Singleitem(
            id: listx[i].id,
            product: listx[i].product,
            photo: listx[i].photo,
            category: listx[i].category,
            price: listx[i].cprice,
            wasprice: listx[i].iprice,
            desc: listx[i].description,
          );



        });
  }
}

class Singleitem extends StatelessWidget {
  final id;
  final product;
  final photo;
  final category;
  final price;
  final wasprice;
  final desc;

  Singleitem(
      {this.id,this.product,this.photo, this.category,this.price, this.wasprice,this.desc});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 8.0),
      child: Card(
        elevation: 6.0,
        color: Colors.cyanAccent,
        child: Hero(
            tag: product,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Viewsingleproduct( id: id,pname: product,price: price,pic:photo,descr: desc)));},
                child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: Column(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Text(
                            product,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: ListTile(
                          /* title: Text(
                        product,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),*/
                          title: Text(
                            category,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          /* leading: Text(
                        "was"+wasprice+"ksh",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),*/
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                child: Text("was" + wasprice + "ksh",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                      decoration: TextDecoration.lineThrough,
                                    )),
                              ),
                              Expanded(
                                  child: Text(
                                "now" + price + "ksh",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: "http://unimart.mabnets.com/products/$photo",
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
