import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/src/basic_widgets/buttons.dart';
import '../colors/extra_colors.dart';

class Lists extends StatefulWidget {
  Lists({Key? key}) : super(key: key);

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  String displayname = "";
  List<String> task1 = [];
  void initState() {
    getdata();
  }

  void getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList('tasklist', tasks);
  }

  List<String> tasks = [
    'gym and training',
    'school project ',
    'buy grocery',
    'take the trash out',
    'visit family',
    'school project ',
    'buy grocery',
    'take the trash out',
    'visit family',
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool deleted = false;
    return Scaffold(
      body: Column(
        children: [
          Container(margin: EdgeInsets.only(top: 30.0)),
          topSkipBack(context, 'Your tasks list'),
          listdismissible(tasks, deleted),
          Container(margin: EdgeInsets.only(top: 10.0)),
          elevatedbutton('Add more items', FontWeight.w500, 18.0, Colors.white,
              primarypurple, context, screenSize, tasks),
        ],
      ),
    );
  }

  Widget listdismissible(tasks, deleted) {
    return SizedBox(
      height: 650.0,
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final item = tasks[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                tasks.removeAt(index);
              });
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },
            background: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 30.0,
            ),
            child: taskItem(item),
          );
        },
      ),
    );
  }

  Widget taskItem(item) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
      height: 75.0,
      child: Card(
        color: Colors.white,
        child: Row(
          children: [
            Container(
              color: primarypurple,
              width: 5.0,
            ),
            buttonIcon(primarypurple),
            Column(
              children: [
                Container(margin: const EdgeInsets.only(bottom: 10.0)),
                textNotifTitle(' Task $item'),
                textdesc(
                    'Contains informations and texts about actions and tasks '),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget topSkipBack(BuildContext context, String s) {
    return Container(
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
    );
  }

  Widget textNotifTitle(String s) {
    return Container(
      width: 240.0,
      margin: const EdgeInsets.only(left: 10.0),
      child: Text(
        s,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Quicksand',
          fontSize: 13.0,
          color: primarypurple,
        ),
      ),
    );
  }

  Widget textdesc(String s) {
    return Container(
      width: 240.0,
      margin: const EdgeInsets.only(left: 10.0),
      child: Text(
        s,
        textAlign: TextAlign.justify,
        maxLines: 2,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Quicksand',
          color: primarygrey,
          fontSize: 11.0,
        ),
      ),
    );
  }
}
