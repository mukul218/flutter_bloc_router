import 'package:block_project/featurs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_item_card.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  
  @override
  void initState() {
    // TODO: implement initState
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.tealAccent,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        buildWhen:  (previous, current) => current is !CartActionState,
        listenWhen:  (previous, current) => current is CartActionState,
        listener: (context, state) {
         switch( state.runtimeType){
           case CartRemoveProductState:
             cartBloc.add(CartInitialEvent());
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product Removed form Cart')));
           default:
         }
        },
        builder: (context, state) {
         switch (state.runtimeType){
           case CartSuccessState:
           final successState = state as CartSuccessState;
           print(successState.cartItems.length);
           if(successState.cartItems.length != 0)
             return ListView.builder(itemCount:successState.cartItems.length ,itemBuilder: (context, index) {
               return CartItemCard(productDataModel: successState.cartItems[index], cartBloc: cartBloc,);
             },);
           else
             return Center(
               child: Container(
                 child: Text('No Item in Cart'),
               ),
             );
           default:
             return Text('');
         }
        },
      ),
    );
  }
}
