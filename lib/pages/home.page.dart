import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easyportas/pages/consulta.orcamento.dart';
import 'package:easyportas/pages/login.page.dart';
import 'package:easyportas/pages/meus.pedidos.dart';
import 'package:easyportas/pages/novo.orcamento.dart';
import 'package:easyportas/pages/teste.exemplo.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'configuracoes.page.dart';

class HomeSistema extends StatelessWidget {
  final List<String> images = [
    'https://www.jsintegracao.com.br/uploads/Carrousel/banner_1.jpg',
    'https://www.jsintegracao.com.br/uploads/Carrousel/banner_apresentacao_easy.jpg',
  ];

  final String nomeEmail;

  HomeSistema({Key key, this.nomeEmail}) : super(key: key);

//classe que busca dados do usuário logado
  Future usuario() async {
    var url =
        "https://www.jsintegracao.com.br/AppEasy/Api/Identificacao_usuario.php";
    var response = await http.post(url, body: {
      "email": nomeEmail, //passando o parametro email
    });

    //verifica se os dados foram carregados
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Erro ao carregar dados do servidor..');
    }
  }

  //declarando as variáveis para uso global
  String idusuario = '1';
  var nomeusuario = 'Jose Deni';
  String idclientefabrica = '7';
  var nomefantasia = 'Jose teste';

  //fim da declaração

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Portas"),
        backgroundColor: Colors.blue,
      ),
      //body: Center(child: Text('My Page!')),
      body: Container(
        //   padding: const EdgeInsets.all(8.0),
        child: CarouselSlider.builder(
          itemCount: images.length,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            //scrollDirection: Axis.vertical,
          ),
          itemBuilder: (context, index, realIdx) {
            return Container(
              child: Center(
                  child: Image.network(images[index],
                      fit: BoxFit.cover, width: 1000)),
            );
          },
        ),
      ),

      //drawer da tela dos menus abaixo
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            /*DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Informações para adicionar'),
            ),*/
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              accountName: Text(nomeusuario),
              accountEmail: Text(nomeEmail),
              currentAccountPicture: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://www.jsintegracao.com.br/easyports/view/img/icon_easy2.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blueAccent),
              title: Text('Inicio'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeSistema(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.blueAccent),
              title: Text('Novo orçamento'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NovoOrcamento(), //busca a page novo.orcamento
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list, color: Colors.blueAccent),
              title: Text('Consultar orçamentos'),
              trailing: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Text('4',
                    style: TextStyle(color: Colors.white, fontSize: 10.0)),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConsultaOrcamento(
                        idcliente: idclientefabrica,
                        idusuariocli: idusuario), // passando os parâmetros
                  ),
                );
              },
            ),

            /* ListTile(
              leading:
                  Icon(Icons.favorite, color: Theme.of(context).accentColor),
              title: Text('My Wishlist'),
              trailing: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Text('4',
                    style: TextStyle(color: Colors.white, fontSize: 10.0)),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/wishlist');
              },
            ),
*/

            Divider(),
            ListTile(
              leading: Icon(Icons.trending_up, color: Colors.blueAccent),
              title: Text('Meus pedidos'),
              trailing: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Text('4',
                    style: TextStyle(color: Colors.white, fontSize: 10.0)),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MeusPedidos(idcliente: idclientefabrica),
                  ),
                );
              },
            ),
            /*   ListTile(
                leading: Icon(Icons.star),
                title: Text("Favoritos"),
                subtitle: Text("meus favoritos..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  debugPrint('toquei no drawer');
                }),*/
            Divider(),

            //ListTile(
            //  leading: Icon(Icons.settings, color: Colors.black),
            //  title: Text('Configurações'),
            //  onTap: () {
            //    Navigator.push(
            //      context,
            //      MaterialPageRoute(
            //        builder: (context) => Teste(),
            //      ),
            //    );
            //  },
            //),

            ListTile(
              leading: Icon(Icons.settings, color: Colors.black),
              title: Text('Configurações'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Configuracoes(),
                  ),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black),
              title: Text('Sair'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
