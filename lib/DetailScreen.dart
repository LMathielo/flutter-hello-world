import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final String name;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
          appBar: AppBar(
            title: Text("Detail Screen"),
          ),
          body: Center(
            
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(name),
            ),
          )
        );
  }
}
