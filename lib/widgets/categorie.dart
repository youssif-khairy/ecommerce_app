import 'package:flutter/material.dart';

class Categorie extends StatelessWidget {
  final String path;
  final String text;
  Categorie({this.text, this.path});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: ListTile(
        onTap: () {},
        subtitle: Text(
          text,
          textAlign: TextAlign.center,
        ),
        title: Image.asset(
          this.path,
          width: 100,
          height: 80,
        ),
      ),
    );
  }
}
