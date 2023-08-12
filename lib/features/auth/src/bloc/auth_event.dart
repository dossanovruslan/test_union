part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthBlocEvent extends AuthEvent {
  final AuthRequest? authRequest;

  AuthBlocEvent({this.authRequest});
}

class LogOutEvent extends AuthEvent {}

class IsAuthorizedEvent extends AuthEvent {}

class LoadingAuthEvent extends AuthEvent {}
