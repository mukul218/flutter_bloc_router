import 'package:block_project/featurs/home/home_bloc/home_bloc.dart';
import 'package:block_project/featurs/home/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeAction,
      buildWhen: (previous, current) => current is! HomeAction,
      listener: (context, state) {
        // TODO: implement listener
        switch (state.runtimeType){
          case HomeNavigateToWishlistAction:
           context.push('/wishlist');
          case HomeNavigateToCartAction:
            context.push('/cart');
          case HomeProductAddedToCartAction:
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product Added to Cart')));
          case HomeProductAddedToWishlistAction:
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product Added to Wishlist')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case HomeLoadingSuccessState:
            final successState = state as HomeLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.tealAccent,
                title: const Text('Grocery'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductNavigateWishlistButtonEvent());
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductNavigateCartButtonEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined))
                ],
              ),
              body:ListView.builder(itemCount: successState.products.length ,itemBuilder: (context,index){
                return ProductCard(productDataModel: successState.products[index], homeBloc: homeBloc,);
              })
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(child: Text('Erro')),
            );
          default:
            return Scaffold(
              body: Center(child: Text('')),
            );
        }
      },
    );
  }
}
