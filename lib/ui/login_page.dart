import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dribbble/config/routes.dart';
import 'package:flutter_dribbble/service/WeatherService.dart';
import 'package:flutter_dribbble/view/switch_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _LoginPage(),
      routes: Routes.map,
    );
  }
}

class _LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

const double login_width = 320.0;
const double login_height = 60.0;
double animateWidth = 100;
double radius = 20;
Color _color = Colors.blue;

class _LoginState extends State<_LoginPage> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _successController;
  bool loginSuccess;
  GlobalKey<SwitchState> switchKey = GlobalKey();
  AnimationController _iconController;
  @override
  void initState() {
    super.initState();
    loginSuccess = false;
    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _successController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _iconController=AnimationController(duration: Duration(milliseconds: 500),vsync: this);
    // _iconController.drive(Tween(begin: 0,end: 1));
    _successController.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.dismissed:
          print("dismissed");
          break;
        case AnimationStatus.completed:
          print("completed");
          Navigator.popAndPushNamed(context, Routes.mainPage);
          // Navigator.pushReplacement(context, MaterialPageRoute(
          //   builder: (context){
          //     return MainPage();
          //   }
          // ));
          break;
        case AnimationStatus.forward:
          print("forward");
          break;
        case AnimationStatus.reverse:
          print("reverse");
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // body: Container(
      //   // color: Colors.pinkAccent,
      //   child: Center(
      //     child: Stack(
      //       children: [
      //         LoginButton(
      //           onTap: () {
      //             doLogin();
      //           },
      //           width: login_width,
      //           height: login_height,
      //           loginState: loginSuccess,
      //           animationController: _controller,
      //           successAnimationController: _successController,
      //         ),
      //         SwitchButton(
      //           switchKey,
      //           onChanged: (bool) {
      //             loginSuccess = bool;
      //             switchKey.currentState.onSwitchChanged(bool);
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return Container(
      child: Stack(
        children: [

         Positioned(
           top: 400,
            left: 200,
            width: 100,
            height: 100,
            child: Container(
              child: MaterialButton(
                child: Text("button"),
                onPressed: () {
                  setState(() {
                    animateWidth = 200.0;
                    _color = Colors.pink;
                    radius = 50.0;
                  });
                },
              ),
            ),
          ),
          Positioned(
            left: 100,
            top: 50,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              width: animateWidth,
              height: animateWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                color: _color,
              ),
              child: Container(),
            ),
          )
          ,
          Positioned(
            left: 100,
            right: 100,
            top: 300,
            child: InkWell(
              child: AnimatedIcon(
                icon: AnimatedIcons.pause_play,
                progress: _iconController.view,
                color: Colors.pink,
                size: 36,
              ),
              onTap: (){
                _controller.forward();
                if(_iconController.status==AnimationStatus.completed){
                  _iconController.reverse();
                }else if(_iconController.status==AnimationStatus.dismissed){
                  _iconController.forward();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Future<int> mockNetwork() async {
    return await Future.delayed(
        Duration(
          milliseconds: 3000,
        ), () {
      return Random().nextInt(10) % 2;
    });
  }

  doLogin() async {
    _controller.forward();
    // int f = await mockNetwork();
    if (!loginSuccess) {
      _controller.reverse();
      // loginSuccess = false;
      print("login: false");
    } else {
      print("login: true");
      _successController.forward();
      _successController.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _successController.dispose();
  }
}
