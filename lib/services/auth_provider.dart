import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Criar uma classe para gerenciar o estado de autenticação
class UserProvider with ChangeNotifier {
  User? _user; // Usuário autenticado

  // Construtor
  UserProvider() {
    // Inicialize o Firebase Auth
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners(); // Notifique os ouvintes quando o estado de autenticação mudar
    });
  }

  // Método para verificar se o usuário está autenticado
  bool get isAuthenticated => _user != null;

  // Método para acessar o usuário autenticado
  User? get user => _user;

  // Método para fazer logout
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
