import 'package:flutter/material.dart';
import 'package:onlineshop/components/productadd.dart';
import 'package:onlineshop/model/cart_model.dart';
import 'package:onlineshop/pages/Home.dart';
// import 'package:onlineshop/pages/homePage.dart';
// import 'package:onlineshop/pages/pcart.dart';
import 'package:onlineshop/services/products_service.dart';
import 'package:provider/provider.dart';

class Ex extends StatefulWidget {
  const Ex({super.key});

  @override
  State<Ex> createState() => _ExState();
}

class _ExState extends State<Ex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductAddPage()));
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            Expanded(
                child: Consumer<CartModel>(builder: (context, value, child) {
              return GridView.builder(
                  itemCount: value.data.length,
                  padding: EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                value.data[index]['imgUrl'],
                                height: 80,
                              ),
                            )),
                            Text(
                              value.data[index]['pname'],
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "stock : " +
                                  value.data[index]['stock'].toString(),
                              style: TextStyle(fontSize: 13),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      deleteItems(value.data[index]['id']);

                                      setState(() {
                                        Provider.of<CartModel>(context,
                                                listen: false)
                                            .removeProduct(index);
                                      });
                                    },
                                    icon: Icon(Icons.cancel)),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    color: Colors.blue,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: value.data[index]['stock'] > 0
                                          ? Text(
                                              "\$:" +
                                                  value.data[index]['price']
                                                      .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            )
                                          : Text("out of Stock",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Text(value.data[index]['pname']),
                          ],
                        ),
                      ),
                    );
                    // return ListTile(
                    //   title: Text(value.data[index]['pname']),
                    //   trailing: IconButton(icon:Icon(Icons.add) ,onPressed: (){
                    //      Provider.of<CartModel>(context,listen: false).addP(index);
                    //   },),
                    // );
                  });
            }))
          ],
        ));
  }
}
