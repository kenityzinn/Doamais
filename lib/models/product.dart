class Product {
  final String? id;
  final String name;
  final num price;
  final String description;
  final String imagePath;
  num quantity;
  double totalPrice;

  Product(
      {required this.name,
      required this.price,
      required this.description,
      required this.imagePath,
      this.id,
      this.quantity = 0,
      this.totalPrice = 0});

  void incrementQuantity() {
    quantity++;
    totalPrice += price;
  }

  void decreamentQuantity() {
    quantity--;
    totalPrice -= price;
  }

  void initialQuantity() {
    quantity = 0;
    totalPrice = 0;
  }

  /*factory Product.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Product(
      id: snapshot.id,
      name: data['name'],
      price: data['price'],
      description: data['description'],
      imagePath: data['imagePath'],
    );
  }*/
}
