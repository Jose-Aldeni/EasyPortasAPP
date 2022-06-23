import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MeusPedidos extends StatelessWidget {
  final String idcliente;

  const MeusPedidos({Key key, this.idcliente}) : super(key: key);

  //função que busca os dados na internet através da URL
  Future<List> pegarPedidos() async {
    var url = Uri.parse(
        'https://www.jsintegracao.com.br/AppEasy/Api/ConsultaPedidos.php');
    var response = await http.post(url, body: {
      "idcliente": idcliente, //passando o parametro idlciente
    });

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
        title: Text("Meus pedidos"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List>(
        future: pegarPedidos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar orçamentos'),
            );
          }

          while (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(DateFormat("dd/MM/yyyy HH:mm:ss").format(
                      DateTime.parse(snapshot.data[index]["datapednotas"]))),
                  subtitle: Text(snapshot.data[index]["codigopedidosnotas"]),
                  trailing: Text(snapshot.data[index]["clientedigitadoorc"]),
                );
              },
            );
          }

          Divider();

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
