// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/mailer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlineshop/pages/Jual.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Blue De Channel","200.5","image/blued.png",Colors.deepPurple],
    ["Cerins","140.00","image/cerins.png",Colors.amber],
    ["Chpee","300.30","image/chpee.png",Colors.orange],
    ["Clipart","220.00","image/Clipart.png",Colors.pink],
    ["banana","2.5","image/bananana.png",Colors.yellow],
    ["ichigo","14.00","image/strawberrt.png",Colors.red],
    ["graps","10.30","image/grape.png",Colors.purple],
    ["avogaro","4.00","image/avogadro.png",Colors.green]
  ];

dynamic _data;
dynamic _dior;
dynamic _jual;

dynamic _cartP = [];

  CartModel() {
    fetchData().then((data) {
      _data = data;
      notifyListeners();
    }).catchError((error) {
      print("Error fetching products: $error");
    });
    diorData().then((dior) {
      _dior = dior;
      notifyListeners();
    }).catchError((error) {
      print("Error fetching Dior products: $error");
    });
    JualData().then((jual) {
      _jual = jual;
      notifyListeners();
    }).catchError((error) {
      print("Error fetching Dior products: $error");
    });
  }

  Future<dynamic> fetchData() async {
    try {
      var response = await http.get(Uri.parse("https://online-shop-backend-6gxn.onrender.com/indexProduct"));
      dynamic data = jsonDecode(response.body);
      return data;
    } catch (e) {
      print("Error fetching products: $e");
      throw e; // Re-throw the error to propagate it
    }
  }
  Future<dynamic> diorData() async {
    try {
      var response = await http.get(Uri.parse("https://online-shop-backend-6gxn.onrender.com/diors"));
      dynamic dior = jsonDecode(response.body);
      return dior;
    } catch (e) {
      print("Error fetching products: $e");
      throw e; // Re-throw the error to propagate it
    }
  }
  Future<dynamic> JualData() async {
     try {
      var response = await http.get(Uri.parse("https://online-shop-backend-6gxn.onrender.com/perfumes"));
      dynamic jual = jsonDecode(response.body);
      return jual;
    } catch (e) {
      print("Error fetching products: $e");
      throw e; // Re-throw the error to propagate it
    }
  }

  get data => _data;
  get dior => _dior;
  get jual => _jual;

  get cartP => _cartP;

  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;


  // add items
  void addItem(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  //increase 
  void addProduct(String name,String image,double price,int stock){
   Map<String,dynamic> newProduct = {
        'pname':name,
        'imgUrl':image,
        'price':price,
        'stock':stock
   };
   _data.add(newProduct);
   notifyListeners();
  }
  void addDior(String name,String image,double price,int stock){
   Map<String,dynamic> newProduct = {
        'name':name.toString(),
        'image':image.toString(),
        'price':price,
        'stock':stock
   };
   _dior.add(newProduct);
   notifyListeners();
  }
   void addJual(String name,String image,double price,int stock){
   Map<String,dynamic> newProduct = {
        'name':name.toString(),
        'image':image.toString(),
        'price':price,
        'stock':stock
   };
   _jual.add(newProduct);
   notifyListeners();
  }
  void addP(index){
    _cartP.add(_data[index]);
     data[index]['stock']--;
     notifyListeners();
  }
  void addD(index){
    _cartP.add(_dior[index]);
    dior[index]['stock']--;
    notifyListeners();
  }
   void addJ(index){
    _cartP.add(_jual[index]);
    jual[index]['stock']--;
    notifyListeners();
  }
  // remove items
  void removeitem(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
  void removeProduct(int index){
    _data.removeAt(index);
    notifyListeners();
  }
    void removeDior(int index){
    _dior.removeAt(index);
    notifyListeners();
  }
    void removeJual(int index){
    _jual.removeAt(index);
    notifyListeners();
  }
  void removeP(int id){
    int cartIndex = _cartP.indexWhere((product) => product['id'] == id);
    int dataIndex = _data.indexWhere((product1) => product1['id'] == id);
    int diorIndex = _dior.indexWhere((product) => product['id'] == id);
    int janeIndex = _jual.indexWhere((product) => product['id'] == id);
  
  if (cartIndex != -1) {
    // Remove the product from _cartP
    _cartP.removeAt(cartIndex);
    notifyListeners();
  }
  
  if (dataIndex != -1 && _data[dataIndex]['stock'] > 0) {
    // If the product is not in _cartP, add it back to stock
    _data[dataIndex]['stock']++;
    notifyListeners();
  }

   if (diorIndex != -1 && _dior[diorIndex]['stock'] > 0) {
    _dior[diorIndex]['stock']++;
    notifyListeners();
  }
  if (janeIndex != -1 && _jual[janeIndex]['stock'] > 0) {
    _jual[janeIndex]['stock']++;
    notifyListeners();
  }
  }
  
   void allP(){
    _cartP.clear();
  notifyListeners();
  }
  //send mail
  void sendEmail({required String recipientEmail, required List<dynamic> products, required String totalPrice}) async {
    String username = 'shonlantkhaing@gmail.com';
    String password = 'eghe dazw irat rusn';
    final smtpServer = gmail(username, password);
    
    String productRows = ""; // String to store HTML for product rows
    
    // Generate HTML for each product
    for (var product in products) {
        productRows += "<tr><td style='border: 1px solid black;'>${product[0]}</td><td style='border: 1px solid black;'>'\$'${product[1]}</td></tr>";
    }
    
    final message = Message()
      ..from = Address(username, 'Perfume Diary')
      ..recipients.add(recipientEmail)
      ..subject = 'Ours online shop'
      ..html = "<h1>Order Details</h1>"
              "<table style='border: 1px solid black;'>"
              "<tr><td style='font-weight: bold;border: 1px solid black;'>Product</td><td style='font-weight: bold;border: 1px solid black;'>Price</td></tr>"
              "$productRows" // Include dynamically generated product rows here
              "</table>"
              "<label style='color:green;font-weight: bold;font-size:20px'>Total Price : ${'\$'+totalPrice} </label>";
    
    try {
      await send(message, smtpServer);
      print('Email sent to $recipientEmail');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
}

  void sendEmail1({required String recipientEmail, required List Product, required String totalPrice }) async {
    String username = 'shonlantkhaing@gmail.com';
    String password = 'eghe dazw irat rusn';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Perfume Diary')
      ..recipients.add(recipientEmail)
      ..subject = 'Ours online shop'
      ..html = "<h1>Order Details</h1>"
              "<table style='border: 1px solid black;'>"
              "<tr><td style='font-weight: bold;border: 1px solid black; border-collapse: collapse;'>Product</td><td style='font-weight: bold;border: 1px solid black; border-collapse: collapse;'>Price</td></tr>"
              "<tr><td style='border: 1px solid black; border-collapse: collapse;'>${Product[0][0]}</td><td style='border: 1px solid black;'>${Product[0][1]}</td></tr>"
              "<tr><td style='border: 1px solid black; border-collapse: collapse;'>${Product[1][0] ?? []}</td><td style='border: 1px solid black; border-collapse: collapse;'>${Product[1][1] ?? []}</td></tr>"
              "<tr><td style='border: 1px solid black; border-collapse: collapse;'>${Product[2][0] ?? []}</td><td style='border: 1px solid black; border-collapse: collapse;'>${Product[2][1] ?? []}</td></tr>"
              "<tr><td style='border: 1px solid black; border-collapse: collapse;'>${Product[3][0] ?? []}</td><td style='border: 1px solid black; border-collapse: collapse;'>${Product[3][1] ?? []}</td></tr>"
              "<tr><td style='border: 1px solid black; border-collapse: collapse;'>${Product[4][0] ?? []}</td><td style='border: 1px solid black; border-collapse: collapse;'>${Product[4][1] ?? []}</td></tr>"
              "<tr><td style='border: 1px solid black; border-collapse: collapse;'>${Product[5][0] ?? []}</td><td style='border: 1px solid black; border-collapse: collapse;'>${Product[5][1] ?? []}</td></tr>"
              "</table>"
              "<label style='color:green;font-weight: bold;font-size:20px'>Total Price : ${'\$'+totalPrice} </label>";
    try {
      await send(message, smtpServer);
      print('Email sent fu to $recipientEmail');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
}
void sendEmailtest({required String recipientEmail, required List<dynamic> products, required String totalPrice,required String ph,required String address}) async {
    String username = 'thantsinphyoe18920@gmail.com';
    String password = 'sfzpgbadunqscpqt';
    final smtpServer = gmail(username, password);
    
    String productRows = ""; // String to store HTML for product rows
    
    // Generate HTML for each product
    for (var product in products) {
        productRows += "<tr><td style='border: 1px solid black;'>${product['pname']}</td><td style='border: 1px solid black;'>${product['price']}</td></tr>";
    }
    
    final message = Message()
      ..from = Address(username, 'Perfume Diary')
      ..recipients.add(recipientEmail)
      ..subject = 'Ours online shop'
      ..html = "<h1>Order Details</h1>"
              "<label>Address : $address</label></br>"
              "<label>Phone : $ph</label>"
              
              "<table style='border: 1px solid black;'>"
              "<tr><td style='font-weight: bold;border: 1px solid black;'>Product</td><td style='font-weight: bold;border: 1px solid black;'>Price</td></tr>"
              "$productRows" // Include dynamically generated product rows here
              "</table>"
              "<label style='color:green;font-weight: bold;font-size:20px'>Total Price : ${'\$'+totalPrice} </label>";
    
    try {
      await send(message, smtpServer);
      print('Email sent to $recipientEmail');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
}





  void removeall(){
    _cartItems.clear();
  notifyListeners();
  }
  void removeAllP(){
    _cartP.clear();
    notifyListeners();
  }
  // calulate total
  String calulate(){
    double totalPrice = 0;
    for(int i=0;i<_cartItems.length;i++){
     totalPrice += double.parse(_cartItems[i][1]) ;
    }
    return totalPrice.toStringAsFixed(2);
  }
  String calulateProduct(){
    double totalPrice = 0;
    for(int i=0;i<_cartP.length;i++){
      totalPrice += (_cartP[i]['price']);
    }
    return totalPrice.toStringAsFixed(2);
  }
}