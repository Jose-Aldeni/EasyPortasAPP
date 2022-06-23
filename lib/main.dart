import 'package:easyportas/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Portas',
      debugShowCheckedModeBanner: false, //tira a mensagem de bug
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(), //chama a página de Splash
    );
  } //fim do widget build

} //fim da classe MyApp
