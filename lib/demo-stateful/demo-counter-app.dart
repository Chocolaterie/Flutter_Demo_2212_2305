import 'package:flutter/material.dart';

void main() {
  runApp(const DemoCounterApp());
}

// Le router de l'application
class DemoCounterApp extends StatelessWidget {
  const DemoCounterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Demo Counter',
      home: DemoCounterPage(),
    );
  }
}

// La page de la demo
class DemoCounterPage extends StatefulWidget {

  @override
  State<DemoCounterPage> createState() {
    return _DemoCounterPageState();
  }
}

class _DemoCounterPageState extends State<DemoCounterPage>{

  int counter = 0;

  incrementCounter(){
    // L'appel setState = Rafraichir les informations dans la vue
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Counter"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Compteur : ${this.counter}'),
              ),
              ElevatedButton(onPressed: incrementCounter, child: Text("Incrementer"))
            ],
          ),
        ),
      ),
    );
  }

}