import 'package:flutter/material.dart';
import 'package:timetable/styledtext.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  bool isCommon = false;
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
          isCommon ? "Common" : DateFormat("MM.dd").format(DateTime.now()),
          style: TextStyle(
            fontSize: 30,
            fontFamily: "White",
            color: Colors.white
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              isCommon = !isCommon;
              print(isCommon);
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
        ),
      ),
    );
  }
}
