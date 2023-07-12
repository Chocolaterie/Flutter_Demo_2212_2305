import 'dart:developer';

import 'package:demo_2212_2305/demo-form/eni-validator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DemoFormApp());
}

// Le router de l'application
class DemoFormApp extends StatelessWidget {
  const DemoFormApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Demo Form',
      home: DemoFormPage(),
    );
  }
}

// La page de la demo
class DemoFormPage extends StatefulWidget {

  @override
  State<DemoFormPage> createState() => _DemoFormPageState();
}

class _DemoFormPageState extends State<DemoFormPage> {

  var _formKey = GlobalKey<FormState>();
  bool mySwitchValue = false;

  void onSubmit(){
    // Enclencher la validation
    if (this._formKey.currentState!.validate()){
      log("Validation correct");
    }
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
          child: Form(
            key: _formKey,
            child: Flex(
              direction: Axis.vertical,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  validator: EniValidator.emailValidator,
                ),
                Switch(value: mySwitchValue, onChanged: (value) { setState(() {
                  this.mySwitchValue = value;
                });  }),
                SizedBox(width : double.infinity, child: ElevatedButton(onPressed: onSubmit, child: Text("Submit")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
