

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:onlineshop/pages/Home.dart';

import 'package:onlineshop/pages/homePage.dart';
import 'package:onlineshop/services/user_service.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  //  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLogin = false;

 Future<bool> _signIn(BuildContext context) async {
  int response = await Login(emailController.text, pwController.text, context);
  if(response == 200){
    _isLogin = true;
    return _isLogin;

    
  }
  else{
    _isLogin = false;
   return _isLogin;
  }
  
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Back my fri"),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text("Log in",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                         border: InputBorder.none,
                         
                          hintText: "Name",
                          prefixIcon: Padding(padding: EdgeInsets.all(8),
                          child: Icon(Icons.person),)
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Please enter your Name";
                          }
                          return null;
                        },
                    ),
                  ),
                ),
              ),
              
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8)
                  ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                      controller: emailController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          prefixIcon: Padding(padding: EdgeInsets.all(8),
                          child: Icon(Icons.mail_outline),)
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Please enter your email";
                          }
                          return null;
                        },
                                 ),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                      controller: pwController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: "Password",
                           border: InputBorder.none,
                          prefixIcon: Padding(padding: EdgeInsets.all(8),
                          child: Icon(Icons.password),)
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Please enter your password";
                          }
                          return null;
                        },
                                 ),
                   ),
                 ),
               ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                 decoration: BoxDecoration(
                   color: Colors.blue,
                   borderRadius: BorderRadius.circular(8)
                 ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5,top: 5,left: 30,right: 30),
                    child: TextButton(onPressed: () async {
            bool loginSuccess = await _signIn(context);
            setState(() {
              _isLogin = loginSuccess;
            });
            print(emailController.text);
            if (_isLogin) {
              // Login successful, do something
             
              Navigator.push(context, MaterialPageRoute(builder: (_) => Home(
                islogin: _isLogin,
                email1: emailController.text,
                name: nameController.text,
              )));
              pwController.clear();
            } else {
              // Login failed, display error message or handle accordingly
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
          content: Text('Login failed!'),
          duration: Duration(seconds: 2),
                ),
              );
            }
          }, 
          child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}