import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference products =
      FirebaseFirestore.instance.collection("imagens");

  Stream<QuerySnapshot> getProductsStream() {
    final productsStream = products.orderBy('name').snapshots();
    return productsStream;
  }
}
