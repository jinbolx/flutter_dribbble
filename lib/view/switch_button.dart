import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final Key key;
 final Function(bool) onChanged;

  SwitchButton(this.key, {@required this.onChanged});

  @override
  State<StatefulWidget> createState() => SwitchState();
}

class SwitchState extends State<SwitchButton> {
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
        value: switchState,
        onChanged: widget.onChanged,
      ),
    );
  }

  void onSwitchChanged(bool state) {
    setState(() {
      switchState = state;
    });
  }
}
