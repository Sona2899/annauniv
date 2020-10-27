// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/smartWidgets/bottomNavRouter/bottomNavRouterView.dart';
import '../ui/views/cgpaCalc/cgpaCalcView.dart';
import '../ui/views/gpaCalc/gpaCalcView.dart';
import '../ui/views/home/homeView.dart';
import '../ui/views/signUp/signUpView.dart';
import '../ui/views/startUp/startupView.dart';

class Routes {
  static const String startupViewRoute = '/';
  static const String homeViewRoute = '/home-view';
  static const String signUpViewRoute = '/sign-up-view';
  static const String bottomNavViewRoute = '/bottom-nav-router-view';
  static const String cgpaCalcViewRoute = '/cgpa-calc-view';
  static const String gpaCalcViewRoute = '/gpa-clac-view';
  static const all = <String>{
    startupViewRoute,
    homeViewRoute,
    signUpViewRoute,
    bottomNavViewRoute,
    cgpaCalcViewRoute,
    gpaCalcViewRoute,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupViewRoute, page: StartupView),
    RouteDef(Routes.homeViewRoute, page: HomeView),
    RouteDef(Routes.signUpViewRoute, page: SignUpView),
    RouteDef(Routes.bottomNavViewRoute, page: BottomNavRouterView),
    RouteDef(Routes.cgpaCalcViewRoute, page: CgpaCalcView),
    RouteDef(Routes.gpaCalcViewRoute, page: GpaClacView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    BottomNavRouterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const BottomNavRouterView(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    CgpaCalcView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CgpaCalcView(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    GpaClacView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => GpaClacView(),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}
