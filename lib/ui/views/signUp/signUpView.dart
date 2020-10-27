import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ui/views/signUp/signUpViewModel.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.nonReactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Center(child: Text(model.title)),
        ),
        body: model.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) {
                          return val.isEmpty || val.length < 4
                              ? "UserName length is too small "
                              : null;
                        },
                        controller: model.userNameTextEditingControllerR,
                        decoration: InputDecoration(hintText: 'UserName'),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val) {
                          return val.isEmpty || val.length < 4
                              ? "Password length is too small "
                              : null;
                        },
                        controller: model.passwordTextEditingControllerR,
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          model.signUp();
                        },
                        child: Container(
                          child: Center(child: Text('SignUp')),
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
      onModelReady: (model) => model.initialize(),
    );
  }
}
