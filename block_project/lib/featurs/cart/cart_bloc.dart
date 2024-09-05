import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_project/data/cart_item.dart';
import 'package:meta/meta.dart';

import '../home/data/data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
   on<CartInitialEvent>(cartInitialEvent);
   on<CartRemoveProductEvent>(cartRemoveProductEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
  emit(CartSuccessState(cartItems:cartItem));
  }

  FutureOr<void> cartRemoveProductEvent(CartRemoveProductEvent event, Emitter<CartState> emit) {
    print('Add to Cart Button Clicked');
    cartItem.remove(event.clickedProduct);
    emit(CartRemoveProductState());
  }
}
