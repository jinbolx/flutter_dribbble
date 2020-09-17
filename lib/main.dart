import 'package:flutter/material.dart';
import 'package:flutter_dribbble/net/cookieUtils.dart';
import 'package:flutter_dribbble/ui/login_page.dart';
import 'package:flutter_dribbble/weather/weather_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CookiesUtils.initDocDir().then((value) {
    runApp(MyApp());
  });

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WeatherPage(),
    );
  }
}
