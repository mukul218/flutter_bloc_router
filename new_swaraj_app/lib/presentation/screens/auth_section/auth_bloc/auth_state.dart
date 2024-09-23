part of 'auth_bloc.dart';

@immutable
// used when we have to change UI
sealed class AuthState {}
// user when we have to preform action like Show Alert, Navigate to new Screen
sealed class AuthStateAction{}

final class AuthInitial extends AuthState {}

final class AuthInitialState extends AuthState {}
final class AuthNoInternetState extends AuthState {}


