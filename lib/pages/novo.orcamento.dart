import 'package:flutter/material.dart';

class NovoOrcamento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informe os dados"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Retornar !'),
        ),
      ),
    );
  }
}
