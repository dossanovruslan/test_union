part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class SuccessAuthState extends AuthState {}

final class LoadingAuthState extends AuthState {}

final class LogOutState extends AuthState {}

final class IsAuthorizedState extends AuthState {
  final bool isAuthorized;

  IsAuthorizedState({this.isAuthorized = false});
}

final class ErrorAuthState extends AuthState {
  final String error;

  ErrorAuthState(this.error);
}
