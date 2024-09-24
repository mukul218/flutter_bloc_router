part of 'main_bloc.dart';

@immutable
// for UI changes
abstract class MainState {}
// for Action like redirection and other
abstract class MainStateAction extends MainState{}

final class MainInitial extends MainState {}

final class LoadingState extends MainState{}