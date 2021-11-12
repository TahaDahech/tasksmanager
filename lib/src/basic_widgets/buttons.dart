import 'package:flutter/material.dart';
import 'package:test2/src/screens/add_task.dart';

Widget buttonIcon(color) {
  return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.list,
        color: color,
      ));
}

Widget elevatedbutton(
    text, fontWeight, size, color, bgcolor, context, screen, tasksList) {
  return SizedBox(
    width: 350.0,
    height: 40.0,
    child: ButtonTheme(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(bgcolor)),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: fontWeight,
            fontFamily: 'Quicksand',
            fontSize: size,
            color: color,
          ),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTask(tasksList: tasksList)));
        },
      ),
    ),
  );
}
