import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "../components/login_button.dart";
import "../components/my_text_field.dart";

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose;
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text(
                  "Foi enviado um link para redefinição de senha! Dê uma olhada no seu e-mail"),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text("Redefinição de Senha")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Insira seu e-mail para receber o link de redefinição de senha",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: _emailController,
              hintText: "e-mail",
              obscureText: false,
            ),
            const SizedBox(height: 25),
            //Botão:
            LoginButton(onTap: passwordReset, text: "Redefinir Senha"),
          ],
        ));
  }
}
