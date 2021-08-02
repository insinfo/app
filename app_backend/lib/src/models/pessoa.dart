//este model representa um item da tabela pessoas
class Pessoa {
  String nome;
  String telefone;

  //esse é um contrututor semelhante ao function __construct() { print "In BaseClass constructor\n"; } do PHP
  //outro recurso interresante do dart é os parametros opcionais nominais 
  Pessoa({this.nome,this.telefone});

  //no dart você pode ter mais de um contrtutor desde que tenha nomes diferentes o que é chamado no dart de contrututores nominas
  //este é um exemplo de contrtutor nominal
  //Isso Map<String,dynamic> é a mesma coisa que array associativo do PHP
  Pessoa.fromMap(Map<String, dynamic> map) {
    nome = map['nome'];
    //no PHP seria a mesma coisa, aqui estou acessando o Map atraves da key
    telefone = map['telefone'];
  }

  //este metodo/função serve para converter um class pessoa para JSON
  Map<String, dynamic> toMap() {
    //no PHP seria $map = array();  e depois $map['nome'] = $nome;
    var map = <String, dynamic>{};  
    map['nome'] = nome;
    map['telefone'] = telefone;
    return map;
  }
}
