import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utills/utills.dart';
import 'package:getx_mvvm/view_models/controller/user_prefrene/user_prefrence_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;

      if (value['error'] == 'user not found') {
        Utills.SnackBar('Login', value['error']);
      } else {
        UserModel userModel = UserModel(token: value['token'], isLogin: true);

        userPreference.saveUser(userModel).then((value) {
          // releasing resouces because we are not going to use this
          Get.toNamed(RouteName.homeView)!.then((value) {});
          Utills.SnackBar('Login', 'Login successfully');
        }).onError((error, stackTrace) {});
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      print(UserPreference().getUser());
      Utills.SnackBar('Error', error.toString());
    });
  }
}
