import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:unimart_app/screens/customIcons.dart';
import 'package:unimart_app/screens/deliveryinfo.dart';
import 'package:unimart_app/screens/horizontalscroll.dart';

class Indexscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return indexscreenstate();
  }
}

class indexscreenstate extends State<Indexscreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Color(0xffffffff),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("unimart user"),
              accountEmail: Text("info@unimart.mabnets.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                Theme
                    .of(context)
                    .platform == TargetPlatform.iOS
                    ? Colors.deepOrangeAccent
                    : Colors.white,
                child: Icon(Icons.person, size: 60.0,color: Colors.deepOrangeAccent,),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.black87, fontSize: 15.0),
                ),
                leading: Icon(
                  Icons.home,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Email us',
                  style: TextStyle(color: Colors.black87, fontSize: 15.0),
                ),
                leading: Icon(
                  Icons.mail,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Call us',
                  style: TextStyle(color: Colors.black87, fontSize: 15.0),
                ),
                leading: Icon(
                  Icons.call,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'About us',
                  style: TextStyle(color: Colors.black87, fontSize: 15.0),
                ),
                leading: Icon(
                  Icons.info_outline,
                ),
              ),
            )
          ],
        ),
      ),
      appBar: new AppBar(
          backgroundColor: Color(0xffffffff),
          title: Text(
            "Unimart",
            style: TextStyle(color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,),
            textAlign: TextAlign.center,
          ),
          elevation: 0.0,
          leading: Builder(
            builder: (context) =>
                IconButton(
                  icon: Icon(Icons.sort),
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  splashColor: Colors.deepOrangeAccent,
                ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.deepOrangeAccent,
                ),
                onPressed: null)
          ]
      ),
      body: SingleChildScrollView(

          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 0,),
                  child: Text(
                    'Shop and Order ',
                    style: TextStyle(fontSize: 26.0,fontFamily: "sofiaPro",fontWeight: FontWeight.w300),
                  )),
              SizedBox(
                height: 22,
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.12),
                          offset: Offset(0, 10),
                          blurRadius: 30)
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(left: 18, right: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search...",
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text('Categories', style: TextStyle(fontSize: 26,fontFamily: "sofiaPro",fontWeight: FontWeight.w300),),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 240,
                width: double.infinity,
                child: HorrizontalList(),
              ),
              Container(
                child: deliveryinfo(),
              )
            ],
          )),
    );
  }
}


