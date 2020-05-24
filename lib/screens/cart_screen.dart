import 'package:ecommerceapp/model/CartData.dart';
import 'package:ecommerceapp/model/provider_brain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProviderBrain>(context).updateTotalCost();
  }

  @override
  Widget build(BuildContext context) {
    List<CartData> list = Provider.of<ProviderBrain>(context).shoppingCart;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.redAccent,
        title: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(context);
            },
            child: Text("Shopping Cart")),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: Text('Total'),
              subtitle: Text(
                CartData.total.toString(),
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              onPressed: () {},
              color: Colors.red,
              child: Text(
                'Check Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(list[index].name),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text('Size :'),
                              Text(
                                '${list[index].size}',
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text('Color :'),
                              Text('${list[index].color}',
                                  style: TextStyle(color: Colors.red))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '\$${list[index].price}',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              leading: Container(
                child: Image.asset(
                  list[index].image,
                  width: 100,
                  height: 100,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Provider.of<ProviderBrain>(context)
                                .incrementProductCount(index);
                          },
                          child: Icon(Icons.arrow_drop_up))),
                  Expanded(child: Text(list[index].count.toString())),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Provider.of<ProviderBrain>(context)
                                .decrementProductCount(index);
                          },
                          child: Icon(Icons.arrow_drop_down))),
                ],
              ),
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
