// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:onlineshop/components/alertbox.dart';
import 'package:onlineshop/login/welcome.dart';
import 'package:onlineshop/model/cart_model.dart';
import 'package:onlineshop/pages/Jual.dart';
import 'package:onlineshop/pages/dior.dart';
import 'package:onlineshop/pages/homePage.dart';
import 'package:onlineshop/pages/introPage.dart';
import 'package:onlineshop/pages/pcart.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  bool? islogin;
  String? name;
  String? email1;
   Home({super.key,this.email1,this.islogin,this.name});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? selectedIndex = 1;
    bool _isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
    homePage(islogin: widget.islogin),
    Dior(islogin: widget.islogin),
    Jual(islogin: widget.islogin),
  ];
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => IntroPage()));
          },
        ),
        backgroundColor: Colors.blue.shade100,
        title: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Alert();
              },
            );
          },
          child: Text("Let's order", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        actions: [
          widget.islogin == true
              ? TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ListTile(
                                  title: Text("Name : ${widget.name}"),
                                  subtitle: Text("email : ${widget.email1.toString()}"),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.islogin = false;
                                      });
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => IntroPage()));
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.logout, color: Colors.white),
                                      title: Text("Logout", style: TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Text(
                        "${widget.name.toString().characters.first.toUpperCase()}",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                )
              : IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
                  },
                  icon: Icon(Icons.person),
                ),
          widget.islogin == true
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => cartP(
                      islogin: widget.islogin,
                      email: widget.email1,
                      name: widget.name,
                      )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Icon(Icons.shopping_cart),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Consumer<CartModel>(
                              builder: (context, value, child) {
                                return Center(
                                  child: Text(
                                    value.cartP.length.toString(),
                                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      body:_isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Text(
                      "Perfume",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == 1 ? Colors.blue : Colors.black,
                        decoration:selectedIndex == 1? TextDecoration.underline : TextDecoration.none,
                      ),
                    )),
                    SizedBox(width: 50,),
                     GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Text(
                      "Dior",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == 2 ? Colors.blue : Colors.black,
                        decoration:selectedIndex == 2? TextDecoration.underline : TextDecoration.none,
                      ),
                    )),
                    SizedBox(width: 50,),
                     GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    child: Text(
                      "jean paul",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == 3 ? Colors.blue : Colors.black,
                        decoration:selectedIndex == 3? TextDecoration.underline : TextDecoration.none,
                      ),
                    )),
               
              ],
            ),
          ),
          if (selectedIndex != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: pages[selectedIndex! - 1],
              ),
            )
        ],
      ),
    );
  }
}
