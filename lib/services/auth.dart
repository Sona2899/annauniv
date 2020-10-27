import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/model/user.dart' as model;

class AuthMethods {
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
    var user = await _auth.currentUser;
    return user.uid;
  }
}
