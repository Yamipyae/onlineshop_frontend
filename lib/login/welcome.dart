import 'package:flutter/material.dart';
import 'package:onlineshop/login/login.dart';
import 'package:onlineshop/login/signin.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Icon(Icons.shopping_cart_checkout_sharp,size: 200,color:Colors.yellow,),
              ),
            ),
          ),
          Column(
          
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                 decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)
                    ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Text("If you have a account Login and shopping have fun!!",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                 
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                            },),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text("---OR---"),
               SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                       decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8)
                        ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                        },),
                      ),
                                    ),
                                   
                                    Container(
                      // width: MediaQuery.of(context).size.width*0.6,
                      child: Text("If you don't have account!\n Now! create a new account",style: TextStyle(fontWeight: FontWeight.bold),),
                                    )
                                  ],
                                ),
                    ),
                  ),
                )
            ],
          ),
        
        ],
      ),
    );
  }
}