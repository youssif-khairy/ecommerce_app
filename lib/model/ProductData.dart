class ProductData {
  String name;
  String image;
  double oldPrice;
  double newPrice;
  List<String> colors;
  List<String> sizes;
  int countInStock;
  ProductData(
      {this.name,
      this.oldPrice,
      this.newPrice,
      this.image,
      this.colors,
      this.sizes,
      this.countInStock});
}
