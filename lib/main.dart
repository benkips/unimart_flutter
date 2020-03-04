import 'package:flutter/material.dart';
import 'package:unimart_app/screens/index.dart';
import 'package:unimart_app/screens/launcher.dart';

void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:new launcher(),
      theme:ThemeData(
       primaryColor: Colors.deepOrangeAccent
      ),
      routes:<String,WidgetBuilder>{
        'screens/launcher':(BuildContext context)=>new launcher(),
        'screens/index':(BuildContext context)=>new Indexscreen(),


      },
    );
  }
}