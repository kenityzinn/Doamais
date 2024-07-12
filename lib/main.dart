import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lojaflutter/firebase_options.dart';
import 'package:lojaflutter/pages/profile_page.dart';
import 'package:lojaflutter/pages/roupas_page.dart';
import 'package:lojaflutter/pages/alimentos_page.dart';
import 'package:lojaflutter/pages/cobertor_page.dart';
import 'package:lojaflutter/services/auth_provider.dart';
import 'package:provider/provider.dart';
import 'models/shop.dart';
import 'pages/cart_page.dart';
import 'pages/intro_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/shop_page.dart';
import 'themes/theme_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Shop()),
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => UserProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        theme: Provider.of<ThemeProvider>(context).themeData,
        routes: {
          '/intro_page': (context) => const IntroPage(),
          '/shop_page': (context) => const ShopPage(),
          '/cart_page': (context) => const CartPage(),
          '/login_page': (context) => const LoginPage(),
          '/register_page': (context) => const RegisterPage(),
          '/profile_page': (context) => const ProfilePage(),
          '/cobertor_page': (context) => const CobertorPage(),
          '/roupas_page': (context) => const RoupasPage(),
          '/alimentos_page': (context) => const AlimentosPage(),
        });
  }
}
