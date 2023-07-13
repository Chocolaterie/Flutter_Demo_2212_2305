import 'dart:developer';
import 'dart:js_interop';
import 'package:demo_2212_2305/demo-webservice/todo.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(const DemoWebServiceApp());
}

// Le router de l'application
class DemoWebServiceApp extends StatelessWidget {
  const DemoWebServiceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Demo WebService',
      home: DemoWebServicePage(),
    );
  }
}

// La page de la demo
class DemoWebServicePage extends StatefulWidget {

  @override
  State<DemoWebServicePage> createState() => _DemoWebServicePageState();
}

class _DemoWebServicePageState extends State<DemoWebServicePage> {

  // Todo de lap age
  Todo? todo;

  // Appeler une api
  void apiCall() async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));

    // Tester si la requete est valide
    if (response.statusCode == 200){
      // conversion : récupérer le json de la réponse
      Map<String, dynamic> json = convert.jsonDecode(response.body);

      // Rafraichir la vue pendant qu'on met à jour le todo
      setState(() {

        // A partir de celle-ci convertir en objet Todo
        todo = Todo.fromJson(json);

        // Log
        log('Le todo : ${todo!.id} -> ${todo!.title}');
      });
    }
  }

  Widget getTodoWidget(){
    if (todo.isUndefinedOrNull)  {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text("Aucun Todo en cours"),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text('Le todo : ${todo!.id} -> ${todo!.title}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Form"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Flex(direction: Axis.vertical, children: [
            getTodoWidget(),
            ElevatedButton(onPressed: apiCall, child: Text("Appeler l'API"))
          ],),
        ),
      ),
    );
  }
}
