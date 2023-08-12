import 'package:dio/dio.dart';
import 'package:test_app_union/common/constants.dart';
import 'package:test_app_union/data/models/auth_request.dart';
import 'package:test_app_union/data/repository/base/base_auth_repo.dart';
import 'package:test_app_union/features/aplication/preferences_utils.dart';
import 'package:test_app_union/features/auth/src/models/auth_response.dart';

class AuthRepo extends BaseAuthRepo {
  final String baseUrl = 'http://45.10.110.181:8080/api/v1/';

  final Dio dio = Dio();

  bool isAuthorized = false;

  init() async {
    isAuthorized =
        SharedPrefs.instance.getString(PreferencesConstants.tokenKey) != null;
  }

  @override
  Future auth(AuthRequest request) async {
    Response<String> response =
        await dio.post("${baseUrl}auth/login", data: request.toMap());
    final authResponse = AuthResponse.fromRawJson(response.toString());
    await SharedPrefs.instance.setString(
      PreferencesConstants.tokenKey,
      authResponse.tokens.accessToken,
    );
    await SharedPrefs.instance.setString(
      PreferencesConstants.userKey,
      authResponse.user.toRawJson(),
    );
  }

  @override
  Future logOut() async {
    SharedPrefs.instance.remove(PreferencesConstants.tokenKey);
    SharedPrefs.instance.remove(PreferencesConstants.userKey);
  }
}
