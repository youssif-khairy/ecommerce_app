import 'package:ecommerceapp/model/ProductData.dart';
import 'package:ecommerceapp/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerceapp/model/provider_brain.dart';

class AllProductsUnless extends StatefulWidget {
  final ProductData item;
  AllProductsUnless({this.item});
  @override
  _AllProductsUnlessState createState() => _AllProductsUnlessState();
}

class _AllProductsUnlessState extends State<AllProductsUnless> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GridView.builder(
        itemCount: Provider.of<ProviderBrain>(context)
            .getListExcept(widget.item)
            .length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Product(
            item: Provider.of<ProviderBrain>(context)
                .getListExcept(widget.item)[index],
          );
        },
      ),
    );
  }
}
