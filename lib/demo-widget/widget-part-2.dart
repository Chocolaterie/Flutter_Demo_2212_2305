import 'package:flutter/material.dart';

class WidgetPart2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.vertical,children: [
      Row(
        children: [Text("test"), Text("test"), Text("test")],
      ),
      Row(
        children: [Text("test"), Text("test"), Text("test")],
      ),
      Column(
        children: [
          Text("test"),
          Text("test"),
          Text("test"),
          Row(children: [Text("test"), Text("test"), Text("test")])
        ],
      ),
    ],);
  }

}