import 'package:ecommerceapp/screens/cart_screen.dart';
import 'package:ecommerceapp/screens/login_screen.dart';
import 'package:flutter/material.dart';

class DrawerUserCard extends StatelessWidget {
  final String name;
  final String email;
  //final String photoURL;
  DrawerUserCard({this.name, this.email});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.redAccent,
          ),
          accountName: Text(name),
          accountEmail: Text(email),
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text('Home'),
          leading: Icon(
            Icons.home,
            color: Colors.red,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text('My Account'),
          leading: Icon(
            Icons.person,
            color: Colors.red,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text('My Orders'),
          leading: Icon(
            Icons.shopping_basket,
            color: Colors.red,
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CartScreen()));
          },
          title: Text('Shopping Cart'),
          leading: Icon(
            Icons.shopping_cart,
            color: Colors.red,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text('Favourite'),
          leading: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text('Settings'),
          leading: Icon(
            Icons.settings,
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text('About'),
          leading: Icon(
            Icons.help,
            color: Colors.blue,
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          title: Text('Logout'),
          leading: Icon(
            Icons.help,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
