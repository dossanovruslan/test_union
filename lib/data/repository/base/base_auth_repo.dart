import 'package:test_app_union/data/models/auth_request.dart';

abstract class BaseAuthRepo {
  ///Авторизация юзера
  Future auth(AuthRequest request);

  ///Выход из профиля
  Future logOut();
}
