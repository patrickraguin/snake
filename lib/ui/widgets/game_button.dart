import 'package:flutter/material.dart';
import 'package:snake/constants.dart';

class GameButton extends StatelessWidget {

  final IconData iconData;
  final void Function() onPressed;
  final bool isActive;

  GameButton(
      {@required this.iconData, @required this.onPressed, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isActive ? Constants.color : Colors.white,
      radius: 28,
      child: IconButton(
        onPressed: onPressed,
        iconSize: 35,
        icon: Icon(iconData),
        splashRadius: 28,
        splashColor: Colors.black,
        color: isActive ? Colors.white : Constants.color,
      ),
    );
  }
}
