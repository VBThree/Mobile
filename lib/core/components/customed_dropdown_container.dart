import 'package:VBThreeMobile/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomedDropdownContainer extends StatelessWidget {
  const CustomedDropdownContainer({Key key, this.child, this.height})
      : super(key: key);
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AllColors.GREY_FOR_BOX_SHADOW.withAlpha(100),
                blurRadius: 6.0,
              ),
            ],
            border: Border.all(
              style: BorderStyle.solid,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: DropdownButtonHideUnderline(child: child));
  }
}
