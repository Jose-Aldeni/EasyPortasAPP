import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ConsultaOrcamento extends StatelessWidget {
  final String idcliente;
  final String idusuariocli;

  const ConsultaOrcamento({Key key, this.idcliente, this.idusuariocli})
      : super(key: key);

  //função que busca os dados na internet através da URL
  Future<List> pegarOrcamentos() async {
    var url = Uri.parse(
        'https://www.jsintegracao.com.br/AppEasy/Api/ConsultaOrcamentos.php');
    var response = await http.post(url, body: {
      "idcliente": idcliente, //passando o parametro idlciente
      "idusuariocli": idusuariocli, //passando o paremetro idusuariocli
    });
    //var response = await http.post(url);

//verifica se os dados foram carregados
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Erro ao carregar dados do servidor..');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultar orçamentos"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List>(
        future: pegarOrcamentos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar orçamentos'),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]['codigopedidosnotas']),

                  //abaixo o subtitle está formatado a data
                  subtitle: Text(DateFormat("dd/MM/yyyy HH:mm:ss").format(
                      DateTime.parse(snapshot.data[index]["datapednotas"]))),

                  trailing: Text(snapshot.data[index]["clientedigitadoorc"]),
                );
              },
              //teste
              shrinkWrap: true,
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
              //teste
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
