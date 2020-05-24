import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, //required
      child: Carousel(
        autoplay: true,
        boxFit: BoxFit.cover,
        dotSize: 4,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/IMG_1266.JPG'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
      ),
    );
  }
}
