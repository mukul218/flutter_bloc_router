part of 'auth_bloc.dart';

@immutable
// use when we need
sealed class AuthEvent {}

// perform all the initial work like (Check App version, Internet Connectivity, Login Status)
class AuthSplashInitialEvent extends AuthEvent{}
class AuthCheckInternewEvent extends AuthEvent{}

