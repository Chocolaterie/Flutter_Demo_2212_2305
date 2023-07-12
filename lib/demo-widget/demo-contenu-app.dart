import 'package:flutter/material.dart';

void main() {
  runApp(const DemoContenuApp());
}

// Le router de l'application
class DemoContenuApp extends StatelessWidget {
  const DemoContenuApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Demo Contenu',
      home: DemoContenuPage(),
    );
  }
}

// La page de la demo
class DemoContenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Contenu"),
      ),
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Text(
              "Un texte",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: Text("Button"))),
            ),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR--tzYoyD1KBzs_JgZYb31bKKbrMbk_4H3Okwdwdyzvs0hyGWvECyCbNpPyEw9Gknu-o&usqp=CAU",
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            Image.asset("images/exemple-dog.jpg")
          ],
        ),
      ),
    );
  }
}
