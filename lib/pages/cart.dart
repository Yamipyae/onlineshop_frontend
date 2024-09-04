// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:onlineshop/model/cart_model.dart';
import 'package:onlineshop/pages/Process/process.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text("My Cart",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body:Consumer<CartModel>(
        builder: (context,value,child){
          return Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: value.cartItems.length,
            itemBuilder:((context, index) {
              return value.cartItems.length == 0 ? SafeArea(child: Text("Your Cart is empty ... ")) : 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.grey[200],
                  leading: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(value.cartItems[index][2])
                    ),
                  title: Text(value.cartItems[index][0],style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('\$'+value.cartItems[index][1]),
                  trailing: GestureDetector(
                    onTap: (){
                      Provider.of<CartModel>(context,listen: false).removeitem(index);
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
                Text('\$'+value.calulate(),style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.bold),)
              ]),
              trailing: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.white),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: GestureDetector(
                   onTap: (){
                    showModalBottomSheet(context: 
                    context, 
                    builder: (BuildContext context){
                      return OrderProcess();
                    });
                  },
                  // onTap: (){
                  //   print("Order Details:");
                  //           for (var item in value.cartItems) {
                  //             print("Product: ${item[0]}, Price: \$${item[1]}");
                  //           }
                  //           print("Total Price: \$${value.calulate()}");
                  //   Provider.of<CartModel>(context,listen: false).sendEmail(
                  //     recipientEmail: "psoneaung815@gmail.com",
                  //     products: value.cartItems,
                  //     totalPrice: value.calulate()
                  //     );
                  //   Provider.of<CartModel>(context,listen: false).removeall();
                  // },
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