import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'res/strings.dart';
import 'res/colors.dart';
import 'res/cupertino_icons.dart';

final List<Task> _tasks = <Task>[];

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<Task> with TickerProviderStateMixin {

  @override
  void dispose() {
    for (Task task in _tasks) task.animationController.dispose();
    super.dispose();
  }

  void handleSubmitted(String text) {
    Task task = Task(
      text: text,
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 700)),
    );
    setState(() {
      _tasks.insert(0, task);
    });
    task.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemBuilder: (_, int index) => _tasks[index],
        reverse: false,
        padding: EdgeInsets.all(8.0),
        itemCount: _tasks.length,
      ),
    );
  }

}

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: defaultTargetPlatform == TargetPlatform.iOS
          ? CupertinoNavigationBar(
              middle: Text(appName), 
              leading: CupertinoButton(child: Icon(IOSIcons.ellipsis),  onPressed: null),
              trailing: CupertinoButton(child: Icon(IOSIcons.add), onPressed: () => Ho),
              actionsForegroundColor: colorSecondary,)
          : AppBar(title: Text(appName), brightness: Brightness.light, elevation: 0.0,),
      
      body: HomePage(),
      
      floatingActionButton: defaultTargetPlatform == TargetPlatform.iOS
        ? null
        : FloatingActionButton.extended(
            elevation: 4.0,
            icon: const Icon(Icons.add),
            label: const Text('Add a task'),
            onPressed: () {},
          ),
      floatingActionButtonLocation: defaultTargetPlatform == TargetPlatform.iOS ? null : FloatingActionButtonLocation.centerDocked,
      
      bottomNavigationBar: defaultTargetPlatform == TargetPlatform.iOS
        ? null
        : BottomAppBar(
        hasNotch: false,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: () {},),
            IconButton(icon: Icon(Icons.clear), onPressed: () {},),
          ],
        ),
      ),
      
    );
  }

}

class Task extends StatelessWidget {
  final String text;
  bool isComplete;
  final AnimationController animationController;
  Task({this.text, this.isComplete, this.animationController});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new Checkbox(value: isComplete, onChanged: (isComplete) => isComplete = !isComplete),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[ Text(text, style: Theme.of(context).textTheme.subhead,),],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
