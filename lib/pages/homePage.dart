// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:onlineshop/components/alertbox.dart';
// import 'package:onlineshop/login/welcome.dart';
import 'package:onlineshop/model/cart_model.dart';
// import 'package:onlineshop/pages/cart.dart';
// import 'package:onlineshop/pages/introPage.dart';
// import 'package:onlineshop/pages/pcart.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class homePage extends StatefulWidget {
  bool? islogin;
  String? name;
  String? email1;

  homePage({super.key, this.islogin, this.email1, this.name});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool _isLoading = false;
 
  @override
  void initState() {
    super.initState();

  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) => IntroPage()));
      //     },
      //   ),
      //   backgroundColor: Colors.blue.shade100,
      //   title: GestureDetector(
      //     onTap: () {
      //       showDialog(
      //         context: context,
      //         builder: (BuildContext context) {
      //           return Alert();
      //         },
      //       );
      //     },
      //     child: Text("Let's order", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      //   ),
      //   actions: [
      //     widget.islogin == true
      //         ? TextButton(
      //             onPressed: () {
      //               showModalBottomSheet(
      //                 context: context,
      //                 builder: (BuildContext context) {
      //                   return Container(
      //                     height: MediaQuery.of(context).size.height * 0.3,
      //                     child: Padding(
      //                       padding: const EdgeInsets.all(30.0),
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           ListTile(
      //                             title: Text("Name : ${widget.name}"),
      //                             subtitle: Text("email : ${widget.email1.toString()}"),
      //                           ),
      //                           Container(
      //                             decoration: BoxDecoration(
      //                               color: Colors.blue,
      //                               borderRadius: BorderRadius.circular(10),
      //                             ),
      //                             child: GestureDetector(
      //                               onTap: () {
      //                                 setState(() {
      //                                   widget.islogin = false;
      //                                 });
      //                                 Navigator.push(context, MaterialPageRoute(builder: (context) => IntroPage()));
      //                               },
      //                               child: ListTile(
      //                                 leading: Icon(Icons.logout, color: Colors.white),
      //                                 title: Text("Logout", style: TextStyle(color: Colors.white)),
      //                               ),
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   );
      //                 },
      //               );
      //             },
      //             child: Container(
      //               height: 36,
      //               width: 36,
      //               decoration: BoxDecoration(
      //                 color: Colors.blue,
      //                 borderRadius: BorderRadius.circular(18),
      //               ),
      //               child: Center(
      //                 child: Text(
      //                   "${widget.name.toString().characters.first.toUpperCase()}",
      //                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      //                 ),
      //               ),
      //             ),
      //           )
      //         : IconButton(
      //             onPressed: () {
      //               Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
      //             },
      //             icon: Icon(Icons.person),
      //           ),
      //     widget.islogin == true
      //         ? GestureDetector(
      //             onTap: () {
      //               Navigator.push(context, MaterialPageRoute(builder: (context) => cartP()));
      //             },
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Stack(
      //                 children: [
      //                   Icon(Icons.shopping_cart),
      //                   Positioned(
      //                     bottom: 0,
      //                     right: 0,
      //                     child: Container(
      //                       height: 13,
      //                       width: 13,
      //                       decoration: BoxDecoration(
      //                         color: Colors.yellow,
      //                         borderRadius: BorderRadius.circular(6),
      //                       ),
      //                       child: Consumer<CartModel>(
      //                         builder: (context, value, child) {
      //                           return Center(
      //                             child: Text(
      //                               value.cartP.length.toString(),
      //                               style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      //                             ),
      //                           );
      //                         },
      //                       ),
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           )
      //         : Container(),
      //   ],
      // ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
            
                Expanded(
                  child: Consumer<CartModel>(builder: (context, value, child) {
                    
                    return value.data == null
          ? Center(child: CircularProgressIndicator())
          :GridView.builder(
                            itemCount: value.data.length,
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
                                            value.data[index]['imgUrl'],
                                            height: 80,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        value.data[index]['pname'],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        "stock : " + value.data[index]['stock'].toString(),
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
                                                    if (value.data[index]['stock'] > 0) {
                                                      Provider.of<CartModel>(context, listen: false).addP(index);
                                                    } else {
                                                      // Show out of stock message or handle accordingly
                                                    }
                                                  },
                                                  child: value.data[index]['stock'] > 0
                                                      ? Text(
                                                          "\$:" + value.data[index]['price'].toString(),
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
                                                  child: value.data[index]['stock'] > 0
                                                      ? Text(
                                                          "\$:" + value.data[index]['price'].toString(),
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