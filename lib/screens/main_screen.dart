import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/widgets/all-products.dart';
import 'package:ecommerceapp/widgets/all_categories.dart';
import 'package:ecommerceapp/widgets/carousel.dart';
import 'package:ecommerceapp/widgets/drawer_user_card.dart';
import 'package:ecommerceapp/widgets/sub_title.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.redAccent,
        title: Text("E-Commerce"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: DrawerUserCard(
          name: 'youssif',
          email: 'youssif@yahoo.com',
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          CarouselWidget(),
          SubTitle(title: 'Categories'),
          AllCategories(),
          SubTitle(title: 'Recent Products'),
          AllProducts(),
        ],
      ),
    );
  }
}
