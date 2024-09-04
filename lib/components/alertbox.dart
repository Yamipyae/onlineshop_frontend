import 'package:flutter/material.dart';
import 'package:onlineshop/pages/addPage/addpage.dart';


class Alert extends StatefulWidget {
  const Alert({super.key});
  

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  TextEditingController Code = TextEditingController();
  void check(){
    if(Code.text == "cmm"){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>addPagePerfume()));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your are not admin'),
        duration: Duration(seconds: 2),
      ),
    );
    }
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Warning!!",style: TextStyle(color: Colors.red),),
      content: Text("This is only for 'Admin'"),
                    actions: [
                       Padding(
               padding: const EdgeInsets.all(10.0),
               child: Container(
                 decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                    controller: Code,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: "Enter code",
                         border: InputBorder.none,
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter your code";
                        }
                        return null;
                      },
                               ),
                 ),
               ),
             ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: ()=>check(),
                            child: Text("Go!",style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Close",style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ],
    );
  }
}