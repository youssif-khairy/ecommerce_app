import 'package:ecommerceapp/model/ProductData.dart';
import 'package:ecommerceapp/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final ProductData item;
  Product({this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetails(
                    item: item,
                  )));
        },
        child: GridTile(
          footer: Container(
            color: Colors.white70,
            child: ListTile(
              leading: Text(
                item.name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              title: Text(
                '\$${item.newPrice.toString()}',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 19,
                ),
              ),
              subtitle: Text(
                '\$${item.oldPrice.toString()}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          child: Image.asset(
            item.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
