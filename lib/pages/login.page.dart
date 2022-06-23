import 'dart:convert';
import 'dart:ui';

import 'package:easyportas/pages/reset_senha.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'home.page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Declara a variável para passagem de parametros do formulario
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();

  //aqui exibe mensagem caso retorne erro
  final snackBar = SnackBar(
    content: Text(
      'Erro e-mail e senha inválidos',
      textAlign: TextAlign.center, // alinha o texto no centro
    ),
    backgroundColor: Colors.redAccent, //define a cor de fundo
  );

  //classe que chama a api e busca o resultado de login
  Future login() async {
    var url = "https://www.jsintegracao.com.br/AppEasy/Api/Login.php";
    var response = await http.post(url, body: {
      "email": email.text, //passando o parametro email
      "senha": senha.text, //passando o paremetro senha
    });
    var data = json.decode(response.body);
    if (data == "Sucesso") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeSistema(nomeEmail: email.text),
        ),
      );
    } else {
      email.clear(); //limpa o e-mail
      senha.clear(); //limpa a senha
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar); //chama o final da mensagem ScanffoldMessenger
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            // ---- abaixo widget onde adicionar a imagem do logo
            SizedBox(
              width: 128,
              height: 128,
              child:
                  Image.asset("images/LogoEasy.png"), //logo imagem do sistema
            ),
            // ---- fim do widget onde adiciona a imagem logo

            //---- widget para espaçamento
            SizedBox(
              height: 10,
            ),
            //---- fim do widget do espaçamento

            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              controller: email,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              validator: (email) {
                if (email == null || email.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              style: TextStyle(fontSize: 20),
            ),

            //---- widget para espaçamento
            SizedBox(
              height: 10,
            ),
            //---- fim do widget do espaçamento

            TextField(
              keyboardType: TextInputType.text,
              controller: senha, //recebe a variável global senha
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),

              style: TextStyle(fontSize: 20),
            ),

            //---- widget para espaçamento
            SizedBox(
              height: 15,
            ),
            //---- fim do widget do espaçamento

            //---- widget de recuperação de senha link
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Esqueceu a senha?",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(),
                    ),
                  );
                },
              ),
            ),
            //---- fim widget de recuperação de senha link

            //---- widget para espaçamento
            SizedBox(
              height: 15,
            ),
            //---- fim do widget do espaçamento

            // ---------- abaixo segue o botao de logar esta no conteiner
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFF3C5A99),
                    Color(0XFF3C5A7F),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Entrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("images/iconlogo.png"),
                          height: 28,
                          width: 28,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    login();
                  },
                ),
              ),
            ),
            // --------------fim do botão logar --------

            // --------------- espaçamento -------------
            SizedBox(
              height: 10,
            ),
            // -------------- fim do espaçamento -------

            //    Container(
            //      height: 40,
            //     alignment: Alignment.centerRight,
            //      child: FlatButton(
            //       child: Text(
            //         "Inicio sistema",
            //        textAlign: TextAlign.right,
            //       ),
            //      onPressed: () {
            //         Navigator.push(
            //           context,
            //            MaterialPageRoute(
            //            builder: (context) => HomeSistema(),
            //           ),
            //        );
            //      },
            //   ),
            //  ),
          ],
        ),
      ),
    );

    //Scaffold
  }
}
