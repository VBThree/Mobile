import 'package:VBThreeMobile/core/base/state/base_state.dart';
import 'package:flutter/material.dart';

class ShadedButton extends StatefulWidget {
  String buttonText = "";
  Function onPressed;
  Color foregroundColor;
  Color textColor;

  ShadedButton(this.buttonText, this.onPressed,
      {this.foregroundColor = Colors.red, this.textColor = Colors.white}) {}
  @override
  State<StatefulWidget> createState() {
    return _ShadedButton();
  }
}

class _ShadedButton extends BaseState<ShadedButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          color: widget.foregroundColor,
        ),
        height: 50,
        width: this.dynamicWidth(0.8),
        child: FlatButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.buttonText,
            style: TextStyle(
              color: widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
