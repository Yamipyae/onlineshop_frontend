// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:onlineshop/model/cart_model.dart';
import 'package:provider/provider.dart';
class Dior extends StatefulWidget {
  bool? islogin;
   Dior({super.key,this.islogin});

  @override
  State<Dior> createState() => _DiorState();
}

class _DiorState extends State<Dior> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
              children: [
            
                Expanded(
                  child: Consumer<CartModel>(builder: (context, value, child) {
                    
                    return value.dior == null
          ? Center(child: CircularProgressIndicator())
          :GridView.builder(
                            itemCount: value.dior.length,
                            padding: EdgeInsets.all(10),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1.3,
                            ),
                            itemBuilder: (context, index) {
                              return 
                               Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: 1,color: Colors.grey)
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            value.dior[index]['image'].toString(),
                                            height: 80,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        value.dior[index]['name'],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        "stock : " + value.dior[index]['stock'].toString(),
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      widget.islogin == true
                                          ? Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.green.shade500,
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    if (value.dior[index]['stock'] > 0) {
                                                      Provider.of<CartModel>(context, listen: false).addD(index);
                                                    } else {
                                                      // Show out of stock message or handle accordingly
                                                    }
                                                  },
                                                  child: value.dior[index]['stock'] > 0
                                                      ? Text(
                                                          "\$:" + value.dior[index]['price'].toString(),
                                                          style: TextStyle(color: Colors.white, fontSize: 15),
                                                        )
                                                      : Text(
                                                          "out of Stock",
                                                          style: TextStyle(color: Colors.white, fontSize: 15),
                                                        ),
                                                ),
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.green.shade500,
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        backgroundColor: Colors.red,
                                                        content: Text("You don't have an account"),
                                                        duration: Duration(seconds: 2),
                                                      ),
                                                    );
                                                  },
                                                  child: value.dior[index]['stock'] > 0
                                                      ? Text(
                                                          "\$:" + value.dior[index]['price'].toString(),
                                                          style: TextStyle(color: Colors.white, fontSize: 15),
                                                        )
                                                      : Text(
                                                          "out of Stock",
                                                          style: TextStyle(color: Colors.white, fontSize: 15),
                                                        ),
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                  }),
                ),
              ],
            ),
    );
  }
}