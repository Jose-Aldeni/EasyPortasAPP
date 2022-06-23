import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpinKit Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          child: SpinKitWave(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
