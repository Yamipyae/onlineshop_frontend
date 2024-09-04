// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:onlineshop/model/cart_model.dart';
import 'package:onlineshop/pages/Process/process.dart';
import 'package:provider/provider.dart';

class cartP extends StatelessWidget {
  bool? islogin;
  String? name,email;
   cartP({super.key,this.islogin,this.email,this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text("My Cart"),
      ),
     body:Consumer<CartModel>(
        builder: (context,value,child){
          return Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: value.cartP.length,
            itemBuilder:((context, index) {
              return value.cartP.length == 0 ? SafeArea(child: Text("Your Cart is empty ... ")) : 
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  tileColor: Colors.grey[200],
                  leading: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(value.cartP[index]['imgUrl'] ?? value.cartP[index]['image'].toString())
                      ),
                  ),
                  title: Text(value.cartP[index]['pname'] ?? value.cartP[index]['name'].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('\$'+value.cartP[index]['price'].toString()),
                  trailing: GestureDetector(
                    
                    onTap: (){
                      // print(value.cartP[index]['id']);
                      Provider.of<CartModel>(context,listen: false).removeP(value.cartP[index]['id']);
                    },
                    child: Icon(Icons.cancel,size: 26,)),
                ),
              );
               
            }) )),
            Padding(
         padding: const EdgeInsets.only(left: 22,right: 22,bottom: 15),
         child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: ListTile(
              leading: Column(children: [
                Text("Total Price",style: TextStyle(fontSize: 12,color:Colors.white),),
                Text('\$'+value.calulateProduct(),style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.bold),)
              ]),
              trailing: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.white),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: value.calulateProduct==0.00 ?GestureDetector(): GestureDetector(
                  // onTap: (){
                  //   print("Order Details:");
                  //           for (var item in value.cartP) {
                  //             print("Product: ${item['pname']}, Price: \$${item['price']}");
                  //           }
                  //           print("Total Price: \$${value.calulateProduct()}");
                  //   Provider.of<CartModel>(context,listen: false).sendEmailtest(
                  //     recipientEmail: "psoneaung815@gmail.com",
                  //     products: value.cartP,
                  //     totalPrice: value.calulateProduct().toString()
                  //     );
                  //   Provider.of<CartModel>(context,listen: false).removeAllP();
                  // },
                                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return OrderProcess(
                        islogin: islogin,
                        email: email,
                        name: name,
                        );
                    },
                  );

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text("Buy Now",style: TextStyle(fontSize: 13,color:Colors.white,fontWeight: FontWeight.bold),),
                  ),
                )),
            
            ),
          ),
         ),
       ),
        
        ],
      );
        },
      ),
    );
  }
}