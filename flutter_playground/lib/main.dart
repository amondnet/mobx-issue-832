import 'package:flutter/material.dart';
import 'package:flutter_playground/counter/counterPage.dart';

void main() => runApp(MaterialApp(home: DemoApp()));

class DemoApp extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(body: SimpleWidget());
}

class SimpleWidget extends StatefulWidget{

  @override
  State<SimpleWidget> createState() => _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CounterPage()
    );
  }
}

