import 'package:graphql_flutter/graphql_flutter.dart';

final getAgenciesByCategoryQuery = gql(r'''

query getProductosByCategory($idCategoria:ID){
  agencias(where:{
    categoria:$idCategoria
  }){
    __typename
    id
   nombre
    acronimo
    direccion
    url
    descripcion
    imagen{
      url
    }
    
  }
}
''');
