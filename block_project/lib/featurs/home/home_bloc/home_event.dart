part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductAddWishlistButtonEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductAddWishlistButtonEvent({required this.clickedProduct});
}

class HomeProductAddCartButtonEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductAddCartButtonEvent({required this.clickedProduct});


}

class HomeProductNavigateWishlistButtonEvent extends HomeEvent {}

class HomeProductNavigateCartButtonEvent extends HomeEvent {}