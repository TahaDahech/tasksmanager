import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/src/colors/extra_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'list.dart';

class AddTask extends StatefulWidget {
  AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  _AddTaskState();

  TextEditingController myControllertitle = TextEditingController();
  TextEditingController myControllerdisc = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Container(margin: const EdgeInsets.only(top: 40.0)),
        topSkipBack(context, 'Add a task'),
        Container(margin: const EdgeInsets.only(top: 40.0)),
        textfieldForm('Add your task title', 18.0),
        Container(margin: const EdgeInsets.only(top: 10.0)),
        formAddtitle('Title'),
        Container(margin: const EdgeInsets.only(top: 20.0)),
        textfieldForm('Add your task discription', 18.0),
        Container(margin: const EdgeInsets.only(top: 10.0)),
        formAdddisc('short discription'),
        Container(margin: const EdgeInsets.only(top: 30.0)),
        elevatedbutton('Pick a date', context, screenSize),
        Container(margin: const EdgeInsets.only(top: 30.0)),
        textfielddate("${selectedDate.toLocal()}".split(' ')[0], 18.0),
        Container(margin: const EdgeInsets.only(top: 30.0)),
        buttonConfirm(),
      ],
    ));
  }

  Widget buttonConfirm() {
    return SizedBox(
      width: 350.0,
      height: 40.0,
      child: ButtonTheme(
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(primarypurple)),
          child: const Text(
            'Confirm',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Quicksand',
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            List<String>? s = prefs.getStringList('tasklist');
            s!.add(myControllertitle.text);
            prefs.setStringList('tasklist', s);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Lists()));
          },
        ),
      ),
    );
  }

  Widget textfieldForm(String text, double size) {
    return Row(children: [
      Container(
        margin: const EdgeInsets.only(left: 20.0),
        height: 20.0,
        child: Text(
          text,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'Quicksand',
            fontSize: size,
            color: primarypurple,
          ),
        ),
      ),
      const Spacer()
    ]);
  }

  Widget textfielddate(String text, double size) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0),
      height: 20.0,
      child: Text(
        text,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Quicksand',
          fontSize: size,
          color: primarypurple,
        ),
      ),
    );
  }

  Widget formAdddisc(String txt) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          height: 45.0,
          child: TextField(
            controller: myControllerdisc,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Quicksand',
            ),
            decoration: InputDecoration(
              fillColor: Colors.white,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(width: 1, color: primarypurple),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(width: 1, color: primardark2),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(
                  width: 1,
                ),
              ),
              hintText: txt,
              hintStyle: const TextStyle(color: primardark2),
              contentPadding: const EdgeInsets.only(left: 10.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget formAddtitle(String txt) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          height: 45.0,
          child: TextField(
            controller: myControllertitle,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Quicksand',
            ),
            decoration: InputDecoration(
              fillColor: Colors.white,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(width: 1, color: primarypurple),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(width: 1, color: primardark2),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(
                  width: 1,
                ),
              ),
              hintText: txt,
              hintStyle: const TextStyle(color: primardark2),
              contentPadding: const EdgeInsets.only(left: 10.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget elevatedbutton(text, context, screenSize) {
    return SizedBox(
      width: 150.0,
      height: 40.0,
      child: ButtonTheme(
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(primarypurple)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.0),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quicksand',
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin: EdgeInsets.only(right: 5.0),
                child: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
            ],
          ),
          onPressed: () => _selectDate(context),
        ),
      ),
    );
  }

  Widget topSkipBack(BuildContext context, String s) {
    return Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 12.0, top: 20.0, right: 60.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: primarypurple,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Lists()));
            },
          ),
        ),
        Container(
          width: 152.0,
          height: 23.0,
          margin: const EdgeInsets.only(top: 20.0),
          child: Text(
            s,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand',
              fontSize: 22.0,
              color: primarydarkpurple,
            ),
          ),
        ),
        const Spacer(),
        Container(),
      ],
    );
  }
}
