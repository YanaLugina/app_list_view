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

/*Widget _myListView() {
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
}*/

/*Widget _myListView() {
  final List<String> items = List<String>.generate(10000, (i) => 'item $i');

  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          title: Text('${items[index]}'),
          leading: Icon(Icons.insert_photo, color: Colors.red),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      );
    },
  );
}*/

/*Widget _myListView() {
  final List<String> items = List<String>.generate(10000, (i) => 'item $i');

  return ListView.separated(
    itemCount: items.length,
    padding: EdgeInsets.all(0),
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          title: Text('${items[index]}'),
          leading: Icon(Icons.insert_photo, color: Colors.red),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      );
    },
    separatorBuilder: (BuildContext context, int index) => Container(
      padding: EdgeInsets.all(5.0),
      child: SizedBox(
        height: 20,
        child: Divider(
          thickness: 5.0,
          indent: 70.0,
          endIndent: 70.0,
          color: Colors.grey.shade300,
        ),
      ),
    ),
  );
}*/

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

Widget _myListView() {
  final List<ListItem> items = List<ListItem>.generate(
      10000,
          (i) => i % 6 == 0
              ? HeadingItem('Heading $i')
              : MessageItem('Sender $i', 'Message body $i')
  );

  return ListView.builder(
    itemCount: items.length,
    padding: EdgeInsets.all(0),
    itemBuilder: (context, index) {
      final item = items[index];
      if(item is HeadingItem) {
        return ListTile(
          title: Text(item.heading, style: Theme.of(context).textTheme.headline6)
        );
      } else if(item is MessageItem) {
        return ListTile(
          title: Text(item.sender),
          subtitle: Text(item.body),
          leading: Icon(Icons.insert_photo, color: Colors.red),
          trailing: Icon(Icons.keyboard_arrow_right),
        );
      } else {
        return null;
      }
    },
  );
}


