import 'package:ecommerceapp/model/CartData.dart';
import 'package:ecommerceapp/model/ProductData.dart';
import 'package:flutter/foundation.dart';

class ProviderBrain extends ChangeNotifier {
  List<CartData> shoppingCart = [
    CartData(
        name: 'SKT',
        price: 50.0,
        image: 'images/products/skt2.jpeg',
        color: 'green',
        size: 'medium'),
    CartData(
        name: 'Hills',
        price: 188.9,
        image: 'images/products/hills1.jpeg',
        color: 'red',
        size: '44'),
  ];
  List<ProductData> list = [
    ProductData(
      name: 'Plaiser',
      oldPrice: 500.0,
      newPrice: 350.0,
      image: 'images/products/blazer1.jpeg',
      colors: ['red', 'green', 'blue', 'black'],
      sizes: ['small', 'medium', 'large'],
      countInStock: 20,
    ),
    ProductData(
      name: 'SKT',
      oldPrice: 75.5,
      newPrice: 50.0,
      image: 'images/products/skt2.jpeg',
      colors: ['red', 'green', 'blue', 'black'],
      sizes: ['small', 'medium', 'large'],
      countInStock: 20,
    ),
    ProductData(
      name: 'Dress',
      oldPrice: 150.9,
      newPrice: 99.99,
      image: 'images/products/dress1.jpeg',
      colors: ['red', 'blue', 'black'],
      sizes: ['small', 'medium', 'large'],
      countInStock: 20,
    ),
    ProductData(
      name: 'Hills',
      oldPrice: 200.0,
      newPrice: 188.9,
      image: 'images/products/hills1.jpeg',
      colors: ['red', 'green', 'black'],
      sizes: ['40', '43', '44', '45'],
      countInStock: 10,
    ),
    ProductData(
      name: 'Pants',
      oldPrice: 15.5,
      newPrice: 9.99,
      image: 'images/products/pants1.jpg',
      colors: ['red', 'green', 'blue'],
      sizes: ['small', 'medium', 'large'],
      countInStock: 30,
    ),
    ProductData(
      name: 'Shoe',
      oldPrice: 350.0,
      newPrice: 300.0,
      image: 'images/products/shoe1.jpg',
      colors: ['green', 'blue', 'black'],
      sizes: ['42', '43', '45', '47'],
      countInStock: 15,
    ),
    ProductData(
      name: 'Plaiser',
      oldPrice: 1250.0,
      newPrice: 1199.99,
      image: 'images/products/blazer2.jpeg',
      colors: ['blue', 'black'],
      sizes: ['small', 'medium'],
      countInStock: 20,
    ),
    ProductData(
      name: 'Pants',
      oldPrice: 60.0,
      newPrice: 40.0,
      image: 'images/products/pants2.jpeg',
      colors: ['red', 'green'],
      sizes: ['medium', 'large'],
      countInStock: 20,
    ),
    ProductData(
      name: 'Dress',
      oldPrice: 110.0,
      newPrice: 99.99,
      image: 'images/products/dress2.jpeg',
      colors: ['red', 'green', 'blue', 'black'],
      sizes: ['small', 'medium', 'large'],
      countInStock: 20,
    ),
    ProductData(
      name: 'Hills',
      oldPrice: 560.0,
      newPrice: 500.0,
      image: 'images/products/hills2.jpeg',
      colors: ['red', 'green', 'blue', 'black'],
      sizes: ['37', '38', '39', '40'],
      countInStock: 20,
    ),
    ProductData(
      name: 'SKT',
      oldPrice: 80.0,
      newPrice: 75.9,
      image: 'images/products/skt1.jpeg',
      colors: ['red', 'green', 'blue', 'black'],
      sizes: ['small', 'medium', 'large'],
      countInStock: 20,
    ),
  ];
  List<ProductData> getListExcept(ProductData except) {
    List<ProductData> result = [];
    for (var item in list) {
      if (item.image != except.image) {
        result.add(ProductData(
            name: item.name,
            image: item.image,
            oldPrice: item.oldPrice,
            newPrice: item.newPrice));
      }
    }
    return result;
  }

  void incrementProductCount(int index) {
    int countInStock = getCountInStock(shoppingCart[index]);
    if (shoppingCart[index].count + 1 <= countInStock)
      shoppingCart[index].count++;

    updateTotalCost();
    notifyListeners();
  }

  void decrementProductCount(int index) {
    if (shoppingCart[index].count - 1 > 0) {
      shoppingCart[index].count--;
      incrementCountInStock(shoppingCart[index]);
    }
    updateTotalCost();
    notifyListeners();
  }

  void incrementCountInStock(CartData cartItem) {
    for (var item in list) {
      if (item.image == cartItem.image) {
        item.countInStock++;
        return;
      }
    }
    notifyListeners();
  }

  int getCountInStock(CartData cartItem) {
    for (var item in list) {
      if (item.image == cartItem.image) {
        if (item.countInStock >= 1) item.countInStock--;
        return item.countInStock;
      }
    }

    notifyListeners();
  }

  void updateTotalCost() {
    double total = 0;
    for (var item in shoppingCart) {
      total += (item.price * item.count);
    }
    CartData.total = total;
    notifyListeners();
  }
}
