import 'package:flutter/cupertino.dart';
import 'package:my_app/app/locator.dart';
import 'package:my_app/app/router.gr.dart';
import 'package:my_app/services/auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  bool isLoading = false;
  String _title = 'SignUp';
  String get title => '$_title';
  final formKey = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  TextEditingController userNameTextEditingControllerR =
      new TextEditingController();
  TextEditingController passwordTextEditingControllerR =
      new TextEditingController();

  void initialize() {
    isLoading = false;
  }

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeViewRoute);
  }

  signUp() {
    if (formKey.currentState.validate()) {
      isLoading = true;
    }
    authMethods
        .signUpWithEmailAndPasssword(userNameTextEditingControllerR.text,
            passwordTextEditingControllerR.text)
        .then((e) async {
      if (e != null) await _navigationService.navigateTo(Routes.homeViewRoute);
      print("$e");
    });
  }
}
