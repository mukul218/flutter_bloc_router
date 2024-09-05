import 'package:block_project/featurs/cart/cart.dart';
import 'package:block_project/featurs/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'featurs/home/home.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Project',
      routerConfig: GoRouter(routes: [
        GoRoute(path: '/',builder: (context, state) => HomePage(),),
        GoRoute(path: '/cart',builder: (context, state) => Cart(),),
        GoRoute(path: '/wishlist',builder: (context, state) => Wishlist(),),
      ]),
      // home: HomePage(),
    );
  }
}
