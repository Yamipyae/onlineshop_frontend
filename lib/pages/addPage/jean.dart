import 'package:flutter/material.dart';
import 'package:onlineshop/components/juleAdd.dart';
import 'package:onlineshop/model/cart_model.dart';
import 'package:onlineshop/services/products_service.dart';
import 'package:provider/provider.dart';

class JeanAdd extends StatefulWidget {
  const JeanAdd({super.key});

  @override
  State<JeanAdd> createState() => _JeanAddState();
}

class _JeanAddState extends State<JeanAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => jualAddPage()));
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            Expanded(
                child: Consumer<CartModel>(builder: (context, value, child) {
              return GridView.builder(
                  itemCount: value.jual.length,
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
                                value.jual[index]['image'].toString(),
                                height: 80,
                              ),
                            )),
                            Text(
                              value.jual[index]['name'].toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "stock : " +
                                  value.jual[index]['stock'].toString(),
                              style: TextStyle(fontSize: 13),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      deleteJual(value.jual[index]['id']);

                                      setState(() {
                                        Provider.of<CartModel>(context,
                                                listen: false)
                                            .removeJual(index);
                                      });
                                    },
                                    icon: Icon(Icons.cancel)),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    color: Colors.blue,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: value.jual[index]['stock'] > 0
                                          ? Text(
                                              "\$:" +
                                                  value.jual[index]['price']
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
