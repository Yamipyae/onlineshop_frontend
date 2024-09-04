import 'package:flutter/material.dart';
import 'package:onlineshop/pages/Home.dart';

import 'package:onlineshop/pages/homePage.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Center(
                child: Container(
                  
                  child:Image.asset('image/underthestar.jpg',height: 150,)),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text("We deliver groceries at your doorsstep",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
              ),
              Text("Fresh Items everyday"),
              Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Text("get started",style: TextStyle(color : Colors.white),)),
              ),
                SizedBox(height: 50,)
            ],
          ),
        ),
      )
    );
  }
}