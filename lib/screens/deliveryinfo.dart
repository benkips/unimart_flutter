import 'package:flutter/material.dart';

class deliveryinfo extends StatefulWidget {
  const deliveryinfo({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return deliveryscreen();
  }
}

class deliveryscreen extends State<deliveryinfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: <Widget>[
          Column(
           children: <Widget>[
             Padding(
               padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
               child: Text(
                 'Our services',
                 style: TextStyle(
                     fontFamily: "sofiaPro",
                     fontWeight: FontWeight.w300,
                     fontSize: 26),
               ),
             ),
              Padding(
               padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
               child: Container(
                 width: double.infinity,
                 height: 100,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                     boxShadow: [
                       BoxShadow(
                           color: Colors.black12,
                           offset: Offset(0, 6),
                           blurRadius: 6)
                     ]),
                 child: Padding(
                   padding: EdgeInsets.only(left: 22, top: 16),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Text(
                         'Quick on time delivery',
                         style: TextStyle(
                             fontFamily: 'sofiaPro',
                             fontSize: 15,
                             color: Colors.deepOrangeAccent),
                       ),
                       Text(
                         'we deliver our products on the best time agreed by our clients which is between 6-12pm at our designated pick up points ',
                         style: TextStyle(fontSize: 13),
                       ),
                     ],
                   ),
                 ),
               ),
             ),

             Padding(
               padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
               child: Container(
                 width: double.infinity,
                 height: 100,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                     boxShadow: [
                       BoxShadow(
                           color: Colors.black12,
                           offset: Offset(0, 6),
                           blurRadius: 6)
                     ]),
                 child: Padding(
                   padding: EdgeInsets.only(left: 22, top: 16),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Text(
                         '24 hour call service',
                         style: TextStyle(
                             fontFamily: 'sofiaPro',
                             fontSize: 15,
                             color: Colors.deepOrangeAccent),
                       ),
                       Text(
                         'Feel free to call us and inquire on anything about our products and service delivery',
                         style: TextStyle(fontSize: 13),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
           ],

          ),


        ],
      ),
    );
  }
}
