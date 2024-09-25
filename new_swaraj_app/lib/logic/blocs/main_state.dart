part of 'main_bloc.dart';

@immutable
// for UI changes
abstract class MainState extends CommonState {}
// for Action like redirection and other
abstract class MainStateAction extends MainState{}

final class MainInitial extends MainState {}

// for loading
final class LoadingState extends MainState{}

// for Internet Connection
final class NoInternetState extends MainState {}
final class HaveInternetState extends MainStateAction {}

// for app Update
final class UpdateAvaliableState extends MainState{}
final class LatestVersionState extends MainStateAction{}

// for Intro Slide
final class ShowIntroSlideState extends MainState{}
final class NotShowIntroSlideState extends MainStateAction{}



// for Error
final class ApiErrorState extends MainState{}