import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bracelet_avenue/screens/home_screen.dart';
import 'package:bracelet_avenue/screens/login_screen.dart';
import 'package:bracelet_avenue/screens/products_screen.dart';
import 'package:bracelet_avenue/widgets/drawer_widget.dart';
import 'package:bracelet_avenue/providers/cart_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bracelet Avenue',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'ComicSans',
        scaffoldBackgroundColor: const Color(0xFFFFF0F5),
      ),
      home: const LoginScreen(),
      routes: {
        '/home': (context) => const MainScreen(),
        '/login': (context) => const LoginScreen(),
        '/products': (context) => const ProductsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: AppDrawer(),
      body: HomeScreen(),
    );
  }
}
