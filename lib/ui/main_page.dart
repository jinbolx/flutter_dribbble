import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
  }

  Future<Null> _playAnimation() async {
    await _animationController.forward().orCancel;
    await _animationController.reverse().orCancel;
  }

  double top = 100.0;
  double left = 150.0;
  double width = 150.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: top,
            left: left,
            child: GestureDetector(
              child: Container(
                child: CircleAvatar(
                  child: Text("A"),
                ),
                width: width,
                height: width,
              ),
              onScaleUpdate: (ScaleUpdateDetails details) {
                setState(() {
                  width = 150.0 * details.scale.clamp(0.8, 5);
                });
              },
              // onPanDown: (DragDownDetails details) {
              //   print("down: ${details.globalPosition}");
              // },
              // onPanUpdate: (DragUpdateDetails details) {
              //   setState(() {
              //     top += details.delta.dy;
              //     left += details.delta.dx;
              //     print("update: top $top,left $left");
              //   });
              // },
              // onPanEnd: (DragEndDetails details) {
              //   print("end: ${details.velocity}");
              // },
            ),
          )
        ],
      ),
    );
  }
// @override
// Widget build(BuildContext context) {
//   return Container(
//     child: GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: () {
//         _playAnimation();
//       },
//       child: Center(
//         child: Container(
//           width: 300,
//           height: 300,
//           decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.1),
//               border: Border.all(color: Colors.black.withOpacity(0.5))),
//         child: StaggerAnimation(_animationController),
//         ),
//       ),
//     ),
//     color: Colors.white,
//   );
// }

//  @override
//  void initState() {
//    super.initState();
//    _animationController =
//        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
//    animation =
//        CurvedAnimation(parent: _animationController, curve: Curves.ease);
//    animation = Tween(begin: 70.0, end: 90.0).animate(animation);
//    _animationController.forward();
//    animation.addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        _animationController.reverse();
//      } else if (status == AnimationStatus.dismissed) {
//        _animationController.forward();
//      }
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
////    DataParseUtil.getAccessToken();
//    return Container(
//      color: Colors.blueAccent,
////      child: ScaleAnimationRoute(),
//      child: GrowTransition(CircleButton(), animation),
//    );
//  }
}

class CircleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: CircleBorder(),
      color: Colors.pinkAccent,
      child: IconButton(
        icon: Icon(
          Icons.forward,
          color: Colors.white,
          size: 44,
        ),
        onPressed: () {},
      ),
    );
  }
}

//class ScaleAnimationRoute extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => ScaleAnimationState();
//}
//
//class ScaleAnimationState extends State<ScaleAnimationRoute>
//    with SingleTickerProviderStateMixin {
//  Animation<double> animation;
//  AnimationController _animationController;
//
//  @override
//  void initState() {
//    super.initState();
//    _animationController =
//        AnimationController(duration: Duration(seconds: 1), vsync: this);
//    animation =
//        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn);
//    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
//      ..addListener(() {
//        setState(() {});
//      });
//    _animationController.forward();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Image.asset(
//        Assets.a,
//        width: animation.value,
//        height: animation.value,
//      ),
//    );
//  }
//
//  @override
//  void dispose() {
//    _animationController.dispose();
//    super.dispose();
//  }
//}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition(this.child, this.animation);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  final AnimationController _animationController;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  StaggerAnimation(this._animationController, {Key key}) : super(key: key) {
    height = Tween<double>(begin: 0.0, end: 300.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.6, curve: Curves.ease)));
    color = ColorTween(begin: Colors.blue, end: Colors.pinkAccent).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 0.6, curve: Curves.ease)));
    padding = Tween<EdgeInsets>(
            begin: EdgeInsets.only(left: 0.0),
            end: EdgeInsets.only(left: 100.0))
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.6, 1.0, curve: Curves.ease)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: _animationController,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50,
        height: height.value,
      ),
    );
  }
}

class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}
