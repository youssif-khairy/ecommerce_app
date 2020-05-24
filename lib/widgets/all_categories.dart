import 'package:ecommerceapp/widgets/categorie.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Categorie(
            text: 'T-Shirt',
            path: 'images/cats/tshirt.png',
          ),
          Categorie(
            text: 'Shoe',
            path: 'images/cats/shoe.png',
          ),
          Categorie(
            text: 'Jeans',
            path: 'images/cats/jeans.png',
          ),
          Categorie(
            text: 'Informal',
            path: 'images/cats/informal.png',
          ),
          Categorie(
            text: 'Formal',
            path: 'images/cats/formal.png',
          ),
          Categorie(
            text: 'Accessories',
            path: 'images/cats/accessories.png',
          ),
          Categorie(
            text: 'Dress',
            path: 'images/cats/dress.png',
          ),
        ],
      ),
    );
  }
}
