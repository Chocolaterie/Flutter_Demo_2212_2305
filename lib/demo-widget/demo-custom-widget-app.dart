import 'package:demo_2212_2305/demo-widget/widget-part-1.dart';
import 'package:demo_2212_2305/demo-widget/widget-part-2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DemoCustomWidgetApp());
}

// Constantes
const colorTest = Color(0xFF51a47b);

// Le router de l'application
class DemoCustomWidgetApp extends StatelessWidget {
  const DemoCustomWidgetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Custom Widget',
      home: DemoCustomWidgetPage(),
    );
  }
}

// La page de la demo
class DemoCustomWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Custom Widget"),
      ),
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          children: [
            WidgetPart1(),
            WidgetPart2(),
            Text("Text en hexadecimal", style: TextStyle(color: colorTest),),
            Column(
              children: [
                Text("test"),
                Text("test"),
                Text("test"),
                Row(children: [Text("test"), Text("test"), Text("test")])
              ],
            )
          ],
        ),
      ),
    );
  }
}
