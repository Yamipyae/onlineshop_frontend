import 'package:flutter/material.dart';
class Product{
  int? id;
  String? pname;
  String? imgUrl;
  double? price;
  Product({this.id,this.imgUrl,this.price,this.pname});
  Product.fromJson(Map<String,dynamic> json){
    id = json['id'];
    pname = json['pname'];
    imgUrl = json['imgUrl'];
    price = json['price'];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['id'] = this.id;
    data['pname'] = this.pname;
    data['imgUrl'] = this.imgUrl;
    data['price'] = this.price;
    return data;

  }
}