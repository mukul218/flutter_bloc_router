part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
// this is use when you have to perform some action (like Navigate to page, show Alert and Other) in UI
sealed class HomeAction extends HomeState{}

final class HomeInitial extends HomeState {}
final class HomeLoadingState extends HomeState {}
final class HomeLoadingSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadingSuccessState({required this.products});
}
final class HomeErrorState extends HomeState {}

final class HomeNavigateToWishlistAction extends HomeAction{}
final class HomeNavigateToCartAction extends HomeAction{}

final class HomeProductAddedToCartAction extends HomeAction{}
final class HomeProductAddedToWishlistAction extends HomeAction{}



