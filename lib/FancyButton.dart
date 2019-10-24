import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  FancyButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    
    return RawMaterialButton(
      fillColor: Colors.deepPurple,
      splashColor: Colors.red,
      child: Text(
        "CLICK ME",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
    );
  }
}