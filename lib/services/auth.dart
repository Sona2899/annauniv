import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/app/locator.dart';
import 'package:my_app/model/user.dart' as model;
import 'package:stacked_services/stacked_services.dart';

class AuthMethods {
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  model.User _userFromFireBaseUser(var user) {
    return user != null ? model.User(userName: user.uid) : null;
  }

  Future signInWithEmailAndPasssword(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      var firebaseUser = result.user;
      return _userFromFireBaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
      _snackbarService.showSnackbar(
        message: e.toString(),
        title: '',
        duration: Duration(seconds: 2),
        onTap: (_) {
          print('snackbar tapped');
        },
        mainButtonTitle: 'Undo',
        onMainButtonTapped: () => print('Undo the action!'),
      );
    }
  }

  Future signUpWithEmailAndPasssword(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var firebaseUser = result.user;
      return _userFromFireBaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
      _snackbarService.showSnackbar(
        message: e.toString(),
        title: '',
        duration: Duration(seconds: 2),
        onTap: (_) {
          print('snackbar tapped');
        },
        mainButtonTitle: 'Undo',
        onMainButtonTapped: () => print('Undo the action!'),
      );
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future currentUser() async {
    var user = _auth.currentUser;
    return user.uid;
  }
}
