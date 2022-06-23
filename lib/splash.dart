import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easyportas/pages/login.page.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds:3),(){
      Navigator.push(context,MaterialPageRoute(
        builder: (context)=>LoginPage(),
      ));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,//cor do fundo do splash
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Carregando...',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),),

          //---- widget para espaçamento
            SizedBox(
              height: 10,
            ),
            //---- fim do widget do espaçamento

              CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              strokeWidth: 11.0,
            ),

          
          ],
        ),
      ),
    );
  }
}
