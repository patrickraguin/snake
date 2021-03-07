import 'package:flutter/material.dart';
import '../../constants.dart';

class GameButton extends StatelessWidget {

  GameButton(
      {required this.iconData, required this.onPressed, this.isActive = false, Key? key}): super(key: key);

  final IconData iconData;
  final void Function() onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isActive ? defaultColor : Colors.white,
      radius: 28,
      child: IconButton(
        onPressed: onPressed,
        iconSize: 35,
        icon: Icon(iconData),
        splashRadius: 28,
        splashColor: Colors.black,
        color: isActive ? Colors.white : defaultColor,
      ),
    );
  }
}
