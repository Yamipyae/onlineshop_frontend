import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void UserSignUP(String name,email,password) async {
  var response = await http.post(Uri.parse('https://online-shop-backend-6gxn.onrender.com/sigin'),
  headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "user":{'name': name,
        'email': email,
        'password': password}
      }),);
    if(response.statusCode == 200){
      print("successful");
    }
    else{
      print("fail");
    }

}

Future<int> Login(String email,password, BuildContext context) async {
  var response = await http.post(Uri.parse('https://online-shop-backend-6gxn.onrender.com/login'),
  headers: <String, String> {
    'Content-Type': 'application/json',
  },
  body: jsonEncode(<String,dynamic>{
    "user":{
      'email':email,
      'password':password
    }
  }),
  );
  if(response.statusCode == 200){
    print("successful");
    return response.statusCode;
    
  }
  else {
    print("fail");
    return response.statusCode;
  }
}