part of 'auth_bloc.dart';

@immutable
// use when we need
sealed class AuthEvent extends MainEvent{}

// perform all the initial work like (Check App version, Internet Connectivity, Login Status)
class CheckClientLoginEvent extends AuthEvent{}



