class CartData {
  String name;
  String image;
  double price;
  String color;
  String size;
  int count;
  static double total = 0;
  CartData(
      {this.size,
      this.color,
      this.image,
      this.name,
      this.price,
      this.count = 1});
}
