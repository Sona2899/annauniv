import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ui/views/startUp/startupViewModel.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Center(child: Text('Login')),
              ),
              body: model.isBusy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.black12),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.height * 0.08,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.08),
                          child: Form(
                            key: model.formKey1,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                TextFormField(
                                  controller:
                                      model.userNameTextEditingController,
                                  decoration:
                                      InputDecoration(hintText: 'UserName'),
                                ),
                                TextFormField(
                                  obscureText: true,
                                  controller:
                                      model.passwordTextEditingController,
                                  decoration:
                                      InputDecoration(hintText: 'Password'),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    model.signIn();
                                  },
                                  child: Container(
                                    height: model.height,
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(20.0)),
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    model.navigateToSignUp();
                                  },
                                  child: Container(
                                    height: 40,
                                    child: Center(
                                      child: Text(
                                        'SignUp',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(20.0)),
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                Spacer(flex: 1),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
        viewModelBuilder: () => StartupViewModel(),
        onModelReady: (model) => model.initialize());
  }
}
