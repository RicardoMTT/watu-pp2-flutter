import 'package:graphql_flutter/graphql_flutter.dart';

final getAllCategoryQuery = gql(r'''
  query getCategories{
  categories{
    id
    nombre
  }
}
''');
