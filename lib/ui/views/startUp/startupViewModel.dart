import 'package:flutter/cupertino.dart';
import 'package:my_app/app/locator.dart';
import 'package:my_app/app/router.gr.dart';
import 'package:my_app/services/auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum AuthStatus { notSignedIn, signIn }

class StartupViewModel extends BaseViewModel {
  final SnackbarService _snackbarService = locator<SnackbarService>();

  final formKey1 = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  TextEditingController userNameTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  bool isBusy = false;
  double height = 40;
  final NavigationService _navigationService = locator<NavigationService>();
  void initialize() {
    height = 30;
    super.initialised;
    notifyListeners();
  }

  Future navigateToSignUp() async {
    await _navigationService.navigateTo(Routes.signUpViewRoute);
  }

  signIn() async {
    height = 30;
    notifyListeners();
    if (formKey1.currentState.validate()) {
      isBusy = true;
      notifyListeners();
    }
    isBusy = false;
    notifyListeners();
    await authMethods
        .signInWithEmailAndPasssword(userNameTextEditingController.text,
            passwordTextEditingController.text)
        .then((e) async {
      if (e != null) {
        _snackbarService.showSnackbar(
          message: '',
          title: 'Login Sucessfully',
          duration: Duration(seconds: 2),
          onTap: (_) {
            print('snackbar tapped');
          },
          mainButtonTitle: 'Undo',
          onMainButtonTapped: () => print('Undo the action!'),
        );
        await _navigationService.clearStackAndShow(Routes.bottomNavViewRoute);
      }
    });
    height = 40;
    notifyListeners();
  }
}
