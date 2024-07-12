/*import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "login_page.dart";
import "shop_page.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              //usuário logado
              if (snapshot.hasData) {
                return ShopPage();
              }
              //usuário deslogado
              else {
                return LoginPage();
              }
            }));
  }
}*/
