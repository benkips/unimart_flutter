import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:unimart_app/screens/categoryitems.dart';

class HorrizontalList extends StatelessWidget{

  const HorrizontalList({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    Future<List> getdata() async{
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          final response=await http.post("https://unimart.mabnets.com/android/categories.php");
          var resu = json.decode(response.body);
          print(resu);
          return json.decode(response.body);
        }
      } on SocketException catch (_) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('No internet'),
              content: Text('check your internet connection'),
              actions: <Widget>[
                new FlatButton(onPressed: (){
                 SystemNavigator.pop();
                },
                    child: Text(
                      'ok'
                    ))
              ],
            ));
      }
    }
    // TODO: implement build
    return Center(
      child: FutureBuilder<List>(
          future: getdata(),
          builder: (ctx,ss){

            if(ss.hasData){
              return cateitems(list: ss.data);
            }else{
              return CircularProgressIndicator();
            }
          }
      ),

    );
  }

}
class cateitems extends StatelessWidget{
  List list;

  cateitems({this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 240,
      child: ListView.builder(
          itemCount: list == null ? 0 : list.length ,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx,i){
            return InkWell(
              child: catecard(
                  name: list[i]['category']
              ),
              onTap: (){
                String categorytobesent=list[i]['category'];
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Categoryitems(categorytobesent:categorytobesent)));
              },
            );
          }),


    );
  }

}
class catecard extends StatelessWidget{
  final name;


  catecard({this.name});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Container(
         width:165,
        height: 240,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 5,right: 5,bottom: 20),
                child: Container(
                  width: 140,
                  height: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color:Colors.black.withOpacity(.1),
                            offset: Offset(0,10),
                            blurRadius: 12

                          )
                        ]
                    ),
                ),
              ),
            ),

              Positioned(

                child:Container(

                  child:_status(name) /*Image.asset('images/cearalicon.png',scale:2.0,width: 80,height: 80)*/,
                )/*_status(name)*/
               /* Image.asset('images/cearalicon.png',width: 80,height: 80),*/
              ),


            Positioned(
              left: 30,
              bottom: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
Widget _status(namez) {
  if (namez== "fruits") {
    return Image.asset('images/fruiticon.jpg',scale:2.0,width: 150,height: 150,);
  } else if(namez == "cereals") {
    return Image.asset('images/cearalicon.png',scale:2.0,width: 150,height: 150,);
  } else if(namez == "gas") {
    return Image.asset('images/gas.png',scale:2.0,width: 150,height: 150,);
  } else if(namez == "flour") {
    return Image.asset('images/flour.png',scale:2.0,width: 150,height: 150,);
  } else if(namez == "grocery") {
    return Image.asset('images/grocery.png',scale:2.0,width: 150,height: 150,);
  } else if(namez == "Cometics") {
    return Image.asset('images/cosmetics.png',scale:2.0,width: 150,height: 150,);
  }else{
    return Image.asset('images/shopping.png',scale:2.0,width: 150,height: 150,);
  }
}
