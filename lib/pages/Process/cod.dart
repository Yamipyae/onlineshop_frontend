// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:onlineshop/model/cart_model.dart';
import 'package:onlineshop/pages/Home.dart';
import 'package:onlineshop/pages/homePage.dart';
import 'package:provider/provider.dart';

class Cod extends StatefulWidget {
  String? address, ph,email,nameo,name;
  bool? islogin;

  Cod({super.key, this.address, this.ph,this.name,this.nameo,this.islogin,this.email});

  @override
  State<Cod> createState() => _CodState();
}

class _CodState extends State<Cod> {
  @override
  Widget build(BuildContext context) {
    return 
     
      AlertDialog(
          title: Column(
            children: [
              Center(
                  child: Text(
                "Please check your order",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              Divider(),
              ListTile(
                title: Text("Address"),
                subtitle: Text("${widget.address}"),
              ),
              ListTile(
                title: Text("Phone"),
                subtitle: Text("${widget.ph}"),
              ),
              Consumer<CartModel>(builder: (context, value, child) {
                return Column(
                  children: [
                    Container(
                      child: ListTile(
                    title: Text("Total amount"),
                    subtitle: Text("\$"+value.calulateProduct()),
                                  ),
                    
                    ),
                    Container(
              child: TextButton(
              child: Text("Confirm"),
              onPressed: (){
                   print("Order Details:");
                            for (var item in value.cartP) {
                              print("Product: ${item['pname'] ?? item['name']}, Price: \$${item['price']}");
                            }
                            print("Total Price: \$${value.calulateProduct()}");
                    Provider.of<CartModel>(context,listen: false).sendEmailtest(
                      recipientEmail: "psoneaung815@gmail.com",
                      ph:widget.ph.toString(),
                      address:widget.address.toString(),
                      products: value.cartP,
                      totalPrice: value.calulateProduct().toString()
                      );
                    Provider.of<CartModel>(context,listen: false).removeAllP();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(
                      islogin: widget.islogin,
                      email1: widget.email,
                      name: widget.nameo,
                      )));
                    setState(() {
                      widget.address="";
                      widget.ph="";
                       Provider.of<CartModel>(context,listen: false).removeAllP();
                    });
              },),
            )
                  ],
                );
              }),
            ],
          ),
          
        
    );
  }
}
