/*aqui entra a classe onde faz a chamada para API
 busca os dados para preenchimento dos parametros a ser
 exibidos */
class Pedidos {
  final int idorcamentosfab; //variável final
  final String codigopedidosnotas; //variável final
  final String clientedigitadoorc; //variável final
  final String nome_fantasia_cli; //variável final

  Pedidos(
      {this.idorcamentosfab,
      this.codigopedidosnotas,
      this.clientedigitadoorc,
      this.nome_fantasia_cli});

/* cria o mapa dos dados buscado através do Json*/
  factory Pedidos.fromJson(Map<String, dynamic> json) {
    return Pedidos(
      idorcamentosfab: json['idorcamentosfab'],
      codigopedidosnotas: json['codigopedidosnotas'],
      clientedigitadoorc: json['clientedigitadoorc'],
      nome_fantasia_cli: json['nome_fantasia_cli'],
    );
  }

  Map<String, dynamic> toJson() => {
        'codigopedidosnotas': codigopedidosnotas,
        'clientedigitadoorc': clientedigitadoorc,
      };
}
