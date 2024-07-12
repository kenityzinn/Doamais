import "package:flutter/material.dart";
import "../components/my_button.dart";

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //logo

           Image.asset("assets/logo.png",
           height: 200,
           width: 200,
           ),

            SizedBox(height: 1),

            //Title
            const Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 25),

            //Subtitle

            Text("",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                )),

            const SizedBox(height: 25),

            //Button
            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Icon(Icons.arrow_forward)),
          ]),
        ));
  }
}
