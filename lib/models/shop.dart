import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:lojaflutter/services/firestore.dart";
import "product.dart";

class Shop extends ChangeNotifier {
  //produtos a venda
  final List<Product> _shop = [];

  //carrinho do usuário
  final List<Product> _cart = [];

  //get lista de produtos
  List<Product> get shop => _shop;

  //get carrinho do usuário
  List<Product> get cart => _cart;

  Shop() {
    // Iniciar a escuta dos produtos
    _startProductStream();
  }
  // Método privado para iniciar a escuta dos produtos
  void _startProductStream() {
    // Obtendo a stream de produtos
    FirestoreService().getProductsStream().listen((QuerySnapshot snapshot) {
      // Convertendo os documentos do snapshot em objetos Product e adicionando à lista _shop
      _shop.clear();
      for (var data in snapshot.docs) {
        _shop.add(Product(
            id: data.id,
            name: data['name'],
            price: data['price'],
            description: data['description'],
            imagePath: data['imagepath']
            // Adicione aqui outros campos conforme necessário
            ));
      }
      // Notificando os ouvintes sobre a atualização da lista de produtos
      notifyListeners();
    });
  }

  //aumentar quantidade do produto
  void incrementQuantity(Product item) {
    _cart.firstWhere((cartItem) => cartItem == item).incrementQuantity();
    notifyListeners();
  }

  void decreamentQuantity(Product item) {
    _cart.firstWhere((cartItem) => cartItem == item).decreamentQuantity();
    notifyListeners();
  }

  void initialQuantity(Product item) {
    _cart.firstWhere((cartItem) => cartItem == item).initialQuantity();
    notifyListeners();
  }

  //adicionar item ao carrinho
  void addToCart(Product item) {
    if (_cart.contains(item)) {
      incrementQuantity(item);
      notifyListeners();
    } else {
      _cart.add(item);
      incrementQuantity(item);
      notifyListeners();
    }
  }

  //remover item do carrinho
  void removeFromCart(Product item) {
    initialQuantity(item);
    _cart.remove(item);
    notifyListeners();
  }

  void decreamentFromCart(Product item) {
    decreamentQuantity(item);
    notifyListeners();
  }
}
