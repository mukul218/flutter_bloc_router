part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}



class CheckInternetEvent extends MainEvent{}
class CheckAppUpdataEvent extends MainEvent{}
class CheckShowIntorSlideEvent extends MainEvent{}
class IntroSlideDoneEvent extends MainEvent{}

