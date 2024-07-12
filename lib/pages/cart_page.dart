import "package:flutter/material.dart";
import "package:ionicons/ionicons.dart";
import "package:provider/provider.dart";
import "../components/my_button.dart";
import "../models/product.dart";
import "../models/shop.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Função para remover item do carrinho
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text("Deseja remover esse item do carrinho?"),
          actions: [
            // botão cancelar
            MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar")),

            // botão confirmar
            MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<Shop>().removeFromCart(product);
                },
                child: const Text("Confirmar"))
          ]),
    );
  }

  // Função para adicionar item ao carrinho ou aumentar quantidade se já existir
  void addItemToCart(BuildContext context, Product product) {
    context.read<Shop>().addToCart(product);
  }

  void decreaseItemToCart(BuildContext context, Product product) {
    context.read<Shop>().decreamentFromCart(product);
  }

  // Função pressionar o botão de pagamento
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
            content:
                Text("Logo conectaremos esse app a uma solução de envio")));
  }

  @override
  Widget build(BuildContext context) {
    // acessar a lista do carrinho _cart
    final cart = context.watch<Shop>().cart;

    double totalPrice = cart.fold<double>(
      0,
      (previousValue, element) => previousValue + (element.totalPrice),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Sacola de doações "),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // lista carrinho
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sua sacola de doações está vazia..."),
                        Icon(Icons.mood_bad)
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // pegar item individual do carrinho
                      final item = cart[index];

                      // retorna como um card na tela "carrinho"
                      return ListTile(
                        leading: Image.network(item.imagePath),
                        title: Text(item.name),
                        subtitle: Text("R\$ ${item.price.toStringAsFixed(2)}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Ionicons.trash_outline),
                              onPressed: () =>
                                  removeItemFromCart(context, item),
                            ),
                            IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: item.quantity >= 2
                                    ? () => decreaseItemToCart(context, item)
                                    : () => removeItemFromCart(context, item)),
                            Text(item.quantity.toString()),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => addItemToCart(context, item),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),

          // Botão de pagamento
          Visibility(
            visible: cart.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: R\$ ${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  MyButton(
                    onTap: () => payButtonPressed(context),
                    child: const Text("Pagamento"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
