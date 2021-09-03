import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String textData;

  Answer(this.selectHandler, this.textData);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 20), onPrimary: Colors.white, ),
          onPressed: () => selectHandler(),
          child: Text(textData)),
    );
  }
}
