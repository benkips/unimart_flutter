import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:unimart_app/screens/ordermodel.dart';

class Databasehelper{
  static Databasehelper _databasehelper;
  static  Database _database;

  Databasehelper._createInstance();

  String ordtbl="orders";
  String colid="id";
  String colprodid="prodid";
  String colprodname="prodname";
  String colprice="prodprice";

  factory Databasehelper(){
    _databasehelper= Databasehelper._createInstance();

    if(_databasehelper==null){
      _databasehelper=Databasehelper._createInstance();
    }
    return _databasehelper;
  }
  Future<Database> initalizeDatabase() async{
    Directory directory= await getApplicationDocumentsDirectory();
    String path=directory.path +"order.db";
    
    var orderdatabase=await openDatabase(path,version: 1,onCreate: _createdb);
    return orderdatabase;

  }
  Future<Database> get database async{
    if(_database==null){
      _database=await initalizeDatabase();
    }
    return _database;
  }
  void _createdb(Database  db,intversion) async {
     await db.execute("Create TABLE $ordtbl($colid INTEGER PRIMARY KEY AUTOINCREMENT,$colprodid INTEGER,$colprodname TEXT,$colprice TEXT)");
  }
  Future<List<Map<String,dynamic>>>getordermaplist() async{
    Database db= await this.database;
    var result=await db.query(ordtbl,orderBy: '$colid ASC');
    return result;
 }
  Future<int>insertorder( Porder porder) async{
    Database db= await this.database;
    var result=await db.insert(ordtbl, porder.toMap());
    return result;
  }
  Future<int>getcount() async{
    Database db= await this.database;
    List<Map<String,dynamic>>x=await db.rawQuery('Select COUNT(*) from $ordtbl');
    int result=Sqflite.firstIntValue(x);
    return result;
  }

}