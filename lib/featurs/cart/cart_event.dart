part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}


class CartInitialEvent extends CartEvent{}
class CartRemoveProductEvent extends CartEvent{
  final ProductDataModel clickedProduct;
  CartRemoveProductEvent({required this.clickedProduct});
}