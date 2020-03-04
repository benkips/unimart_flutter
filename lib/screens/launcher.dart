import 'package:flutter/material.dart';
import 'dart:async';

import 'package:unimart_app/screens/clippercrop.dart';





class launcher extends StatefulWidget {
const launcher ({Key key}) : super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return launcherstate();
  }
}

class launcherstate extends State<launcher> {

  @override
  void initState() {
    super.initState();
    debugPrint("started hapa");
    Timer(Duration(seconds: 5),finished);
    
  }
  void finished(){
    debugPrint("finshed bana");
    Navigator.pushReplacementNamed(context, 'screens/index');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipPath(
            clipper: Launchercliper(),
            child: Container(
              width: double.infinity,
              height: 500,
              child: Stack(
                children: <Widget>[
                  Positioned(
                     left: 0,
                      top: 0,
                      bottom: 0,
                    child:  Image.asset(
                      'images/unimart.jpg',
                      fit:BoxFit.cover,

                    ),
                  ),
                  Positioned(
                    left: 0,
                      right: 0,
                    bottom: 0,
                    child: Container(
                      width: double.infinity,
                      height: 340,
                      decoration: BoxDecoration(
                        gradient:LinearGradient(
                          colors: [
                            Color(0xffFF8C00).withOpacity(.8),
                            Color(0xffFFA07A).withOpacity(.05),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0.0, bottom: 15.0),
                child: Text(
                  "Unimart",
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.deepOrangeAccent,
          )
        ],
      ),

    );
  }
}

