import 'package:flutter/material.dart';
import 'package:onlineshop/login/login.dart';
import 'package:onlineshop/services/user_service.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController pwController = TextEditingController();
    TextEditingController cPwController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up for shopping"),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text("Sign In",style: TextStyle(
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
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextFormField(
                      controller: cPwController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: "Confirm Password",
                           border: InputBorder.none,
                          prefixIcon: Padding(padding: EdgeInsets.all(8),
                          child: Icon(Icons.password),)
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Please enter your confirm password";
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
                    child: TextButton(onPressed: () {
                    if(pwController.text == cPwController.text){
                    UserSignUP(nameController.text, emailController.text, pwController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    }
                    else{
                       ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("password and confirm password did not match"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                    }
                    }, child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
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