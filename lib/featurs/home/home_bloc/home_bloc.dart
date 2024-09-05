import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_project/data/cart_item.dart';
import 'package:block_project/data/grocery_data.dart';
import 'package:block_project/data/wishlist_item.dart';
import 'package:meta/meta.dart';

import '../data/data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductNavigateCartButtonEvent>(homeProductNavigateCartButtonEvent);
    on<HomeProductNavigateWishlistButtonEvent>(
        homeProductNavigateWishlistButtonEvent);
    on<HomeProductAddCartButtonEvent>(homeProductAddCartButtonEvent);
    on<HomeProductAddWishlistButtonEvent>(homeProductAddWishlistButtonEvent);
  }
  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(Duration(seconds: 2));
    emit(
      HomeLoadingSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductNavigateCartButtonEvent(
      HomeProductNavigateCartButtonEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartAction());
  }

  FutureOr<void> homeProductNavigateWishlistButtonEvent(
      HomeProductNavigateWishlistButtonEvent event, Emitter<HomeState> emit) {
    // print('Navigate to WishList Button Clicked');
    emit(HomeNavigateToWishlistAction());
  }

  FutureOr<void> homeProductAddCartButtonEvent(
      HomeProductAddCartButtonEvent event, Emitter<HomeState> emit) {
    print('Add to Cart Button Clicked');
    cartItem.add(event.clickedProduct);
    emit(HomeProductAddedToCartAction());
  }

  FutureOr<void> homeProductAddWishlistButtonEvent(
      HomeProductAddWishlistButtonEvent event, Emitter<HomeState> emit) {
    print('Add to Wishlist Button Clicked');
    wishlistItem.add(event.clickedProduct);
    emit(HomeProductAddedToWishlistAction());
  }
}
