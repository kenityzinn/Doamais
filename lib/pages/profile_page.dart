import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "../components/text_box.dart";
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    String creationDate = '';
    if (user?.metadata.creationTime != null) {
      DateTime creationTime = user!.metadata.creationTime!;
      DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      creationDate = dateFormat.format(creationTime);
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
            title: const Text("Perfil"),
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: ListView(
          children: [
            const SizedBox(height: 50),

            //perfil icone
            const Icon(Icons.person, size: 72),

            const SizedBox(height: 10),

            Text("Meu Perfil",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary)),

            const SizedBox(height: 50),

            Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  "Informações da Conta",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                )),

            MyTextBox(
              text: user?.email ?? '',
              sectionName: "E-mail",
            ),

            MyTextBox(
              text: creationDate,
              sectionName: "Data de Criação",
            )
          ],
        ));
  }
}
