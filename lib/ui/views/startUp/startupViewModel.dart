import 'package:flutter/cupertino.dart';
import 'package:my_app/app/locator.dart';
import 'package:my_app/app/router.gr.dart';
import 'package:my_app/services/auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum AuthStatus { notSignedIn, signIn }

class StartupViewModel extends BaseViewModel {
  final formKey1 = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  TextEditingController userNameTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  bool isLoading = false;
  final NavigationService _navigationService = locator<NavigationService>();
  void initialize() {
    super.initialised;
  }

  Future navigateToSignUp() async {
    await _navigationService.navigateTo(Routes.signUpViewRoute);
  }

  signIn() async {
    if (formKey1.currentState.validate()) {
      isLoading = true;
    }
    authMethods
        .signInWithEmailAndPasssword(userNameTextEditingController.text,
            passwordTextEditingController.text)
        .then((e) async {
      if (e != null)
        await _navigationService.clearStackAndShow(Routes.bottomNavViewRoute);

      print("$e");
    });
  }
}
