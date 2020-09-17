import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final double width;
  final double height;
  Function() onTap;
  final AnimationController animationController;
  final AnimationController successAnimationController;
  Animation<double> _width;
  Animation<double> _scale;
  bool loginState = false;

  LoginButton(
      {@required this.onTap,
      this.width = 320.0,
      this.height = 60.0,
      @required this.loginState,
      @required this.animationController,
      @required this.successAnimationController,
      Key key})
      : super(key: key) {
    _width = Tween<double>(
      begin: width,
      end: height,
    ).animate(
      animationController,
    );
    _scale = Tween<double>(
      begin: height,
      end: 1000.0,
    ).animate(CurvedAnimation(
        parent: successAnimationController, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedBuilder(
        animation: _width,
        builder: (BuildContext context, Widget child) {
          return Container(
            width: loginState ? _scale.value : _width.value,
            height: loginState ? _scale.value : height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.pink,
              border: Border.all(color: Colors.blue),
              // boxShadow: [BoxShadow(color: Colors.blue,offset: Offset(5.0,5.0))],
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: Visibility(
              child: _width.value > height
                  ? Text(
                      "登录",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  : CircularProgressIndicator(
                      value: null,
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
              visible: !loginState,
            ),
          );
        },
      ),
    );
  }
}
