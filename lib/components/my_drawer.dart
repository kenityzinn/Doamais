import 'package:flutter/material.dart';
import '../services/auth_provider.dart';
import 'my_list_tile.dart';
import "../themes/theme_provider.dart";
import 'package:provider/provider.dart';
import '../themes/theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>().themeData;
    final userLoggedIn = context.watch<UserProvider>().isAuthenticated;
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      'assets/cesta.png',
                      height: 100,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),

                MyListTile(
                    text: "Pagina Inicial",
                    icon: Icons.house,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/shop_page");
                    }),

                const SizedBox(height: 25),
                //shop
                MyListTile(
                    text: "Cobertores",
                    icon: Icons.local_hotel_rounded,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/cobertor_page");
                    }),

                const SizedBox(height: 25),
                //shop
                MyListTile(
                    text: "Roupas",
                    icon: Icons.checkroom_outlined,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/roupas_page");
                    }),

                const SizedBox(height: 25),
                //shop
                MyListTile(
                    text: "Alimentos",
                    icon: Icons.fastfood,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/alimentos_page");
                    }),

              ],
            ),
            //cabeçalho drawer : logo

            //exit
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Column(
                children: [
                  MyListTile(
                      text: userLoggedIn ? "Sair" : "Login",
                      icon: userLoggedIn
                          ? Icons.logout
                          : Icons.account_circle_outlined,
                      onTap: () {
                        if (userLoggedIn) {
                          Navigator.pop(context);
                          context.read<UserProvider>().signOut();
                        } else {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, "/login_page");
                        }
                      }),
                  MyListTile(
                      text: theme == lightMode ? "Modo Escuro" : "Modo Claro",
                      icon: theme == lightMode
                          ? Icons.toggle_off
                          : Icons.toggle_on_outlined,
                      onTap: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}
