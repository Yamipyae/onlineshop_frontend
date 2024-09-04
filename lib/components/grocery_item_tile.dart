// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
class GroceryItemsTile extends StatelessWidget {
  String itemName,itemPrice,image;
  final color;
  void Function()? onPressed;

  GroceryItemsTile({super.key,required this.itemPrice,this.color,required this.itemName,required this.image,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: color[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(image,height: 60,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Text(itemName),
          ),
          MaterialButton(
            onPressed: onPressed,
          color: color,
          child: Text( '\$' + itemPrice,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          )
      
        ],),
      ),
    );
  }
}