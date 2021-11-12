import 'package:flutter/material.dart';

Widget textfieldForm(String text, double sizetext, double size, Color color) {
  return SizedBox(
    height: size,
    child: Text(
      text,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Quicksand',
        fontSize: size,
        color: color,
      ),
    ),
  );
}

Widget smallTextFieldX(String txt, Color color1, Color color2, double spacing) {
  return Container(
    height: 45.0,
    margin: EdgeInsets.only(right: spacing, top: 10.0, left: spacing),
    child: TextFormField(
      //onSaved: (string) {},
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Quicksand',
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(width: 1, color: color1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(width: 1, color: color2),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            width: 1,
          ),
        ),
        hintText: txt,
        hintStyle: TextStyle(color: color2),
        contentPadding: const EdgeInsets.only(left: 20.0),
      ),
    ),
  );
}
