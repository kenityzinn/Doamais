import "package:flutter/material.dart";
import "package:lojaflutter/components/my_drawer.dart";
import "package:lojaflutter/components/my_product_tile.dart";
import "package:lojaflutter/themes/theme.dart";
import "package:provider/provider.dart";
import "../models/shop.dart";
import "../themes/theme_provider.dart";
import '../services/auth_provider.dart';

class RoupasPage extends StatelessWidget {
  const RoupasPage({super.key});

  @override
  Widget build(BuildContext context) {
    //acessar produtos da classe SHOP
    final products = context.watch<Shop>().shop.where((element) => element.name == "roupa").toList();
    final cart = context.watch<Shop>().cart;
    final theme = context.watch<ThemeProvider>().themeData;
    final userLoggedIn = context.watch<UserProvider>().isAuthenticated;

    num totalProducts = cart.fold<num>(
        0, (previousValue, element) => previousValue + (element.quantity));

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Roupas"),
            actions: [
              IconButton(
                  onPressed: () {
                    userLoggedIn
                        ? Navigator.pushNamed(context, '/profile_page')
                        : Navigator.pushNamed(context, '/login_page');
                  },
                  icon: userLoggedIn
                      ? const Icon(Icons.account_circle)
                      : const Icon(Icons.account_circle_outlined)),
              //botão carrinho de compras
              Stack(
                children: [
                  IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/cart_page"),
                      icon: const Icon(Icons.badge_outlined)),
                  Visibility(
                    visible: cart.isNotEmpty,
                    child: CircleAvatar(
                        backgroundColor: theme == lightMode
                            ? const Color.fromARGB(149, 26, 20, 20)
                            : const Color.fromARGB(255, 249, 249, 249),
                        radius: 10,
                        child: Center(
                          child: Text(totalProducts.toString(),
                              style: TextStyle(
                                fontSize: 10,
                                color: theme == lightMode
                                    ? Colors.white
                                    : Colors.black,
                              )),
                        )),
                  ),
                ],
              )
            ]),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(children: [
          const SizedBox(height: 25),
        
          //subtítulo página de compras
          Center(
              child: Text("Doe Roupas",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ))),
                  

          //lista de produtos
          SizedBox(
            height: 550,
            child: products.isNotEmpty
                ? ListView.builder(
                    itemCount: products.length,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(15),
                    itemBuilder: (context, index) {
                      //pega cada produto individual da lista products
                      final product = products[index];
                      //retorna um tile UI
                      return MyProductTile(product: product);
                    },
                  )
                : Center(
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).colorScheme.inversePrimary),
                        ))),
          )
        ]));
  }
}
