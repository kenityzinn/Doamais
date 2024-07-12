import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../models/product.dart";
import "../models/shop.dart";

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  // função adicionar ao carrinho pressionando botão add
  void addToCart(BuildContext context) {
    //Mostrar caixa de confirmação após apertar o botão
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text("Deseja adicionar a sua sacola de doações ?"),
          actions: [
            // botão cancelar
            MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar")),

            //botão confirmar
            MaterialButton(
                onPressed: () {
                  Navigator.pop(context);

                  context.read<Shop>().addToCart(product);
                },
                child: const Text("Confirmar"))
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(25),
        width: 300,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // imagem do produto
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(12)),
                        width: double.infinity,
                        padding: const EdgeInsets.all(25),
                        child: Image.network(product.imagePath)),
                  ),

                  const SizedBox(height: 25),

                  // nome do produto
                  Text(product.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),

                  const SizedBox(height: 10),

                  // descrição do produto
                  Text(product.description,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary)),

                  const SizedBox(height: 25),

                  // preço do produto + botão "adicionar ao carrinho"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Preço do Produto
                      Text("\$${product.price.toStringAsFixed(2)}"),

                      Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                              onPressed: () => addToCart(context),
                              icon: const Icon(Icons.add)))
                    ],
                  ),
                ],
              )
            ]));
  }
}
