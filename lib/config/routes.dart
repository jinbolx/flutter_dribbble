import 'package:flutter/cupertino.dart';
import 'package:flutter_dribbble/ui/login_page.dart';
import 'package:flutter_dribbble/ui/main_page.dart';

class Routes {
  static final String loginPage = '/login_page';
  static final String mainPage = '/main_page';
  static Map<String, WidgetBuilder> map = {
    loginPage: (context) {
      return LoginPage();
    },
    mainPage:(context){
      return MainPage();
    }
  };
}
