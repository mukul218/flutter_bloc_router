part of 'auth_bloc.dart';

@immutable
// used when we have to change UI
sealed class AuthState extends CommonState {}
// user when we have to preform action like Show Alert, Navigate to new Screen
sealed class AuthStateAction extends AuthState{}

final class AuthInitial extends AuthState {}




