// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:onlineshop/pages/Home.dart';

import 'package:onlineshop/pages/addPage/diorAdd.dart';
import 'package:onlineshop/pages/addPage/ex.dart';
import 'package:onlineshop/pages/addPage/jean.dart';


// ignore: must_be_immutable
class addPagePerfume extends StatefulWidget {
  bool? islogin;
  String? name;
  String? email1;
   addPagePerfume({super.key,this.email1,this.islogin,this.name});

  @override
  State<addPagePerfume> createState() => _addPagePerfumeState();
}

class _addPagePerfumeState extends State<addPagePerfume> {
  int? selectedIndex = 1;
    bool _isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
    Ex(),
    diorAdd(),
    JeanAdd(),
  ];
    return Scaffold(
appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
        },),
        backgroundColor: Colors.blue.shade100,
        title: Text("Perfume"),
       
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
                        decoration:selectedIndex == 1? TextDecoration.underline : TextDecoration.none,
                      ),
                    )),
                    SizedBox(width: 20,),
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
                        decoration:selectedIndex == 2? TextDecoration.underline : TextDecoration.none,
                      ),
                    )),
                    SizedBox(width: 20,),
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
