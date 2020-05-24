import 'package:ecommerceapp/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/model/provider_brain.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GridView.builder(
        itemCount: Provider.of<ProviderBrain>(context).list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Product(
            item: Provider.of<ProviderBrain>(context).list[index],
          );
        },
      ),
    );
  }
}
