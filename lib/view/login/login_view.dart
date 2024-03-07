import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/network/network_api_sarvices.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utills/utills.dart';
import 'package:getx_mvvm/view_models/controller/login/login_view_model.dart';
import 'package:get/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  NetworkApi otpValidate = NetworkApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    // if form is empty then its show snackbar
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Utills.SnackBar('error', 'plese enter email');
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utills.fieldFocus(context, loginVM.emailFocusNode.value,
                          loginVM.passwordFocusNode.value);
                    },
                    controller: loginVM.emailController.value,
                    decoration: const InputDecoration(
                        hintText: 'email', border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // if form is empty then its show snackbar
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Utills.SnackBar('error', 'plese enter password');
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {},
                    controller: loginVM.passwordController.value,
                    focusNode: loginVM.passwordFocusNode.value,
                    decoration: const InputDecoration(
                        hintText: 'password', border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(() => RoundButton(
                widgth: 200,
                title: 'login',
                loading: loginVM.loading.value,
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    otpValidate.postApi(
                        loginVM.emailController.value.text.toString(),
                        AppUrl.otpValidateApi);
                  }
                }))
          ],
        ),
      ),
    );
  }
}
