import 'package:graphql_flutter/graphql_flutter.dart';

final getAgencia = gql(r'''
  query getAgencia($id:ID!){
  agencia(id:$id){
    id
    nombre
    acronimo
    direccion
    url
    imagen{
      url
    }
    categoria{
      id
    }
    descripcion
    programas{
      id
      nombre
      descripcion
      vacantes_disponibles
    }
  }
}
''');
