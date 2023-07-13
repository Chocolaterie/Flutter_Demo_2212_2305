import 'dart:developer';
import 'dart:js_interop';
import 'package:demo_2212_2305/demo-webservice/todo.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(const DemoListviewApp());
}

// Le router de l'application
class DemoListviewApp extends StatelessWidget {
  const DemoListviewApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo WebService',
      home: DemoListviewPage(),
    );
  }
}

// La page de la demo
class DemoListviewPage extends StatefulWidget {
  @override
  State<DemoListviewPage> createState() => _DemoListviewPageState();
}

class _DemoListviewPageState extends State<DemoListviewPage> {
  // Ma liste de todos
  var todos = [];

  // Appeler une api
  void apiCall() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    // Tester si la requete est valide
    if (response.statusCode == 200) {
      // conversion : récupérer le json de la réponse
      var json = convert.jsonDecode(response.body);

      // Rafraichir la vue pendant qu'on met à jour le todo
      setState(() {
        // A partir de celle-ci convertir en objet Todo
        todos = json.map((data) => Todo.fromJson(data)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Form"),
      ),
      body: Container(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(onPressed: apiCall, child: Text("Appeler l'API")),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        height: 60,
                        child: Container(
                          color: Colors.black12,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  'Le todo : ${todos[index]!.id} -> ${todos[index]!.title}'),
                            )));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
