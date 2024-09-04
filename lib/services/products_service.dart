import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:onlineshop/model/productModel.dart';

Future<List<Product>> indexProduct() async {
  try {
    // Use HTTP instead of HTTPS if not needed
    var response = await http.get(Uri.parse('https://online-shop-backend-6gxn.onrender.com/indexProduct'));
    
    if (response.statusCode == 200) {
      print("Request successful");
      List<dynamic> dataList = jsonDecode(response.body);
      List<Product> products = dataList.map((item) => Product.fromJson(item)).toList();
      return products;
    } else {
      print("Request failed with status: ${response.statusCode}");
      throw Exception("Failed to load products: ${response.reasonPhrase}");
    }
  } catch (e) {
    print("Error: $e");
    throw Exception("Failed to load products: $e");
  }
}
void deleteItems(int id) async{
  var response = await http.delete(Uri.parse('https://online-shop-backend-6gxn.onrender.com/delete_product?id=${id}'));
  if(response.statusCode == 200){
    print("successful");
  }
  else{
    print("fail");
  }
}
void addItems(String name, String image, double price, int stock) async {
  try { 
    var response = await http.post(
      Uri.parse('https://online-shop-backend-6gxn.onrender.com/product_add'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'pname': name,
        'imgUrl': image,
        'price': price,
        'stock': stock,
      }),
    );

    if (response.statusCode == 200) {
      print("Item added successfully");
    } else {
      print("Failed to add item. Error code: ${response.statusCode}");
      // You might want to provide more detailed error handling here
    }
  } catch (e) {
    print("Failed to add item. Exception: $e");
    // You might want to provide more detailed error handling here
  }
}
 void deleteDior(int id) async{
  var response = await http.delete(Uri.parse('https://online-shop-backend-6gxn.onrender.com/diors/$id'));
  if(response.statusCode == 200){
    print("successful");
  }
  else{
    print("fail");
  }
}

void DiorAddF(String name, String image, double price, int stock) async {
  try { 
    var response = await http.post(
      Uri.parse('https://online-shop-backend-6gxn.onrender.com/diors'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name.toString(),
        'image': image.toString(),
        'price': price,
        'stock': stock,
      }),
    );

    if (response.statusCode == 200) {
      print("Item added successfully");
    } else {
      print("Failed to add item. Error code: ${response.statusCode}");
      // You might want to provide more detailed error handling here
    }
  } catch (e) {
    print("Failed to add item. Exception: $e");
    // You might want to provide more detailed error handling here
  }
}
 void deleteJual(int id) async{
  var response = await http.delete(Uri.parse('https://online-shop-backend-6gxn.onrender.com/perfumes/$id'));
  if(response.statusCode == 200){
    print("successful");
  }
  else{
    print("fail");
  }
}

void jualAddF(String name, String image, double price, int stock) async {
  try { 
    var response = await http.post(
      Uri.parse('https://online-shop-backend-6gxn.onrender.com/perfumes'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name.toString(),
        'image': image.toString(),
        'price': price,
        'stock': stock,
      }),
    );

    if (response.statusCode == 200) {
      print("Item added successfully");
    } else {
      print("Failed to add item. Error code: ${response.statusCode}");
      // You might want to provide more detailed error handling here
    }
  } catch (e) {
    print("Failed to add item. Exception: $e");
    // You might want to provide more detailed error handling here
  }
}