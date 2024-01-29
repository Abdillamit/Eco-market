class Products {
  int? id;
  String? image;
  String? name;
  String? description;
  int? category;
  int? quantity;
  String? price;
  double? totalSum;

  Products(
      {this.id,
      this.image,
      this.name,
      this.description,
      this.category,
      this.quantity,
      this.price,
      this.totalSum});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      image: json['image'],
      name: json['title'],
      description: json['description'],
      category: json['category'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': name,
      'description': description,
      'category': category,
      'quantity': quantity,
      'price': price,
    };
  }
}
