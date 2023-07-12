import 'package:flutter/material.dart';

class WidgetPart1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [Text("test"), Text("test"), Text("test")],
      ),
      Row(
        children: [Text("test"), Text("test"), Text("test")],
      ),
    ],);
  }
}