import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Building List View'),
          centerTitle: true,
        ),
        body: MyListView(),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  return ListView(
    padding: EdgeInsets.all(8.0),
    // shrinkWrap: true, // very heavy, need many recalculation actions, do not use this
    // scrollDirection: Axis.horizontal,
    // itemExtent: 300,  // GOOD, need to use, light for core ! this set max width for children when Axis.horizontal, or max height when Axis.vertical
    // reverse: true,
    children: <Widget>[
      ListTile(
        title:Text('Sun'),
        subtitle: Text('Today Clear'),
        leading: Icon(Icons.wb_sunny, color: Colors.orangeAccent,),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap:() => {},
      ),
      ListTile(
        title:Text('Cloudy'),
        subtitle: Text('Today Cloudy'),
        leading: Icon(Icons.wb_cloudy, color: Colors.blue.shade300),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap:() => {},
      ),
      ListTile(
        title:Text('Snow'),
        subtitle: Text('Today Snow'),
        leading: Icon(Icons.ac_unit, color: Colors.grey),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap:() => {},
      ),
    ],
  );
}
