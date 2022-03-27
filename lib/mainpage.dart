import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timetable/styledtext.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  bool isCommon = false;
  String today = DateFormat("MM.dd").format(DateTime.now());
  String title = DateFormat("MM.dd").format(DateTime.now());

  List task = [Task("08:00", "10:00", "1교시 수업", new DateTime.now()),];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00968c),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 30,
            fontFamily: "White",
            color: Colors.white
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                isCommon = !isCommon;
                if (isCommon){
                  title = "Common";
                }
                else {
                  title = DateFormat("MM.dd").format(DateTime.now());
                }
              });
            },
            icon: Icon(Icons.change_circle_outlined),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: <Tab>[
            Tab( text: "Mon" ),
            Tab( text: "Tue" ),
            Tab( text: "Wed" ),
            Tab( text: "Thr" ),
            Tab( text: "Fri" ),
            Tab( text: "Sat" ),
            Tab( text: "Sun" ),
          ],
          indicator: BoxDecoration(
            color: Colors.white
          ),
          labelColor: const Color(0xff00968c),
          unselectedLabelColor: Colors.white,
          labelStyle: TextStyle(
            fontFamily: "White",
            fontSize: 10
          ),
        ),
        elevation: 4,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: task.length,
            itemBuilder: (context, idx) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StyledText(text: task[idx].start, size: 14, color: false, oblique: false),
                        StyledText(text: task[idx].end, size: 14, color: false, oblique: false)
                      ],
                    ),
                    title: StyledText(text: task[idx].text, size: 22, color: false, oblique: true),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: const Color(0xff00968c),
                margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                elevation: 4,
              );
            }
          ),
          Text("2"),
          Text("3"),
          Text("4"),
          Text("5"),
          Text("6"),
          Text("7")
        ],
      )
    );
  }
}

class Task {
  DateTime time;
  String start;
  String end;
  String text;

  Task(this.start, this.end, this.text, this.time);
}