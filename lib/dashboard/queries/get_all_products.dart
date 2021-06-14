import 'package:graphql_flutter/graphql_flutter.dart';

final getAllAgenciesQuery = gql(r'''
 query getAgencies{
  agencias{
    id
    nombre
    acronimo
    direccion
    url
    descripcion
    categoria{
      id
    }
    imagen{
      url
    }
  }
}
''');
