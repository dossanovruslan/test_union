import 'package:flutter/material.dart';
import 'package:test_app_union/common/constants.dart';
import 'package:test_app_union/features/aplication/preferences_utils.dart';
import 'package:test_app_union/features/auth/src/models/user.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel();

  late final User user;

  init() {
    String? getUser =
        SharedPrefs.instance.getString(PreferencesConstants.userKey);
    if (getUser != null) {
      user = User.fromRawJson(getUser);
    }
  }
}
