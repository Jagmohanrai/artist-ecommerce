class Product {
  final int id;
  final String name;
  final String brand;
  final String imageURL;
  final int price;

  Product(this.id, this.name, this.brand, this.imageURL, this.price);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json["id"],
      json["name"],
      json["brand"],
      json["imageURL"],
      json["price"],
    );
  }
}
