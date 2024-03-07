import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_prefrene/user_prefrence_view_model.dart';

class SplashSarvices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) {
      print(value.token);
      print(value.isLogin);
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(Duration(seconds: 3), () => Get.toNamed(RouteName.loginView));
      } else {
        Timer(Duration(seconds: 3), () => Get.toNamed(RouteName.homeView));
      }
    });
  }
}
