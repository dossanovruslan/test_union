import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test_app_union/data/models/auth_request.dart';
import 'package:test_app_union/data/server/auth_repo.dart';
import 'package:test_app_union/features/auth/src/models/error_message.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<AuthBlocEvent>(_onAuthEvent);
    on<LogOutEvent>(_onLogOutEvent);
    on<IsAuthorizedEvent>(_onIsAuthorizedEvent);
  }

  FutureOr<void> _onAuthEvent(
    AuthBlocEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(LoadingAuthState());
      if (authRepo.isAuthorized) {
        emit(SuccessAuthState());
        return;
      }
      if (event.authRequest != null) {
        await authRepo.auth(event.authRequest!);
        emit(SuccessAuthState());
      }
    } on DioException catch (e) {
      var error = ErrorMessage.fromJson(json.decode(e.response?.data)).message;

      emit(ErrorAuthState(error));
    } on Exception catch (e) {
      emit(ErrorAuthState(e.toString()));
    }
  }

  FutureOr<void> _onLogOutEvent(
    LogOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(LoadingAuthState());

      await authRepo.logOut();

      emit(LogOutState());
    } on DioException catch (e) {
      var error = ErrorMessage.fromJson(e.response?.data).message;
      emit(ErrorAuthState(error));
    }
  }

  FutureOr<void> _onIsAuthorizedEvent(
    IsAuthorizedEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(LoadingAuthState());

      if (authRepo.isAuthorized) {
        print(authRepo.isAuthorized);
        emit(IsAuthorizedState(isAuthorized: true));
        return;
      }

      emit(IsAuthorizedState(isAuthorized: false));
      print(authRepo.isAuthorized);
    } on DioException catch (e) {
      var error = ErrorMessage.fromJson(e.response?.data).message;
      emit(ErrorAuthState(error));
    }
  }
}
