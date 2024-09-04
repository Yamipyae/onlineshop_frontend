import 'package:flutter/material.dart';
import 'package:onlineshop/model/cart_model.dart';
import 'package:onlineshop/services/products_service.dart';
import 'package:provider/provider.dart';

class jualAddPage extends StatefulWidget {
  const jualAddPage({super.key});

  @override
  State<jualAddPage> createState() => _jualAddPageState();
}

class _jualAddPageState extends State<jualAddPage> {
  final TextEditingController nameContoller =TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imgUrlController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameContoller,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: "Product Name",
                      prefixIcon: Padding(padding: EdgeInsets.all(8),
                      child: Icon(Icons.abc_outlined),)
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter your product name";
                      }
                      return null;
                    },
                  ),
                   const SizedBox(height: 8),
                   TextFormField(
                    controller: priceController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: "Price",
                      prefixIcon: Padding(padding: EdgeInsets.all(8),
                      child: Icon(Icons.price_change),)
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter your price";
                      }
                      return null;
                    },
                   ),
                   const SizedBox(height: 8,),
                   TextFormField(
                  controller: imgUrlController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "image",
                    prefixIcon: Padding(padding: EdgeInsets.all(8),
                    child: Icon(Icons.image),)
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter your image";
                    }
                    return null;
                  },
                   ),
                   const SizedBox(height: 8,),
                   TextFormField(
                    controller: stockController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: "stock",
                      prefixIcon: Padding(padding: EdgeInsets.all(8),
                      child: Icon(Icons.apps),)
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter your stock";
                      }
                      return null;
                    },
                   ),
                   const SizedBox(height: 20,),
                   Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(5)
                    ),
                     child: TextButton(
                      onPressed:(){
                        double price = double.parse(priceController.text);
                        int stock = int.parse(stockController.text);
                         jualAddF(nameContoller.text, imgUrlController.text, price, stock);
                         setState(() {
                           Provider.of<CartModel>(context,listen: false).addJual(nameContoller.text, imgUrlController.text, price, stock);
                         });
                          Navigator.pop(context); 
                      } 
                     , child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("Add Items",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                     )),
                   )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}