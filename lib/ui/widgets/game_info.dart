import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snake/constants.dart';

class GameInfo extends StatelessWidget {

  final String label;
  final int value;

  GameInfo(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label.toUpperCase(),
          style: GoogleFonts.chakraPetch(
              fontSize: 14, fontWeight: FontWeight.w600, color: Constants.color),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          width: 90,
          decoration: BoxDecoration(
            color: Constants.color,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 0.1,
                blurRadius: 30,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Text(
            value.toString(),
            textAlign: TextAlign.center,
            style: GoogleFonts.chakraPetch(
                fontSize: 14, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        )
      ],
    );
  }
}
