
 class Porder{
  int _id;
  String _prodid;
  String _prodname;
  String _price;

  Porder(this._id, this._prodid, this._prodname, this._price);

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  String get prodname => _prodname;

  set prodname(String value) {
    _prodname = value;
  }


  String get prodid => _prodid;

  set prodid(String value) {
    _prodid = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Map<String,dynamic> toMap(){
    var map=Map<String,dynamic>();
    map['id']=_id;
    map['prodid']=_prodid;
    map['prodname']=_prodname;
    map['price']=_price;

    return map;
  }
  Porder.fromMapObject(Map<String,dynamic> map){
    this._id=map['id'];
    this._prodid=map['prodid'];
    this._prodname=map['prodname'];
    this._price=map['price'];
  }

 }