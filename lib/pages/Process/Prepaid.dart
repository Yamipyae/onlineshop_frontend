import 'package:flutter/material.dart';
class Prepadid extends StatefulWidget {
  const Prepadid({super.key});

  @override
  State<Prepadid> createState() => _PrepadidState();
}

class _PrepadidState extends State<Prepadid> {
  TextEditingController choose = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Payment Method",style: TextStyle(color: Colors.black ),),
      actions: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextFormField(
           controller: choose,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(),
          ),
        )
      ],
    );
  }
}