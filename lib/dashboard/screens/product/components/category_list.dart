import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:flutter/material.dart';
import 'package:probardispositivofisico/dashboard/queries/get_all_products.dart';
import 'package:probardispositivofisico/dashboard/queries/get_categories.dart';
import 'package:probardispositivofisico/dashboard/queries/get_products_by_category.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/products_controller.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key key}) : super(key: key);

  //List categories = ['All', 'Sofaaa', 'Parking', 'Test', 'Otro'];

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: getAllCategoryQuery,
      ),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading && result.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<dynamic> categories = result.data['categories'];
        return Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          height: 30,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () async {
                AgenciesController.to.itemSelected.value = index;
                final _client = Get.find<GraphQLClient>();

                if (categories[index]['nombre'] == 'general') {
                  final _request = QueryOptions(
                      document: getAllAgenciesQuery,
                      fetchPolicy: FetchPolicy.networkOnly);
                  final _resp = await _client.query(_request);
                  AgenciesController.to.listAgencies.value =
                      _resp.data['agencias'];
                } else {
                  final _request = QueryOptions(
                    document: getAgenciesByCategoryQuery,
                    variables: {"idCategoria": categories[index]['id']},
                  );

                  final _resp = await _client.query(_request);

                  AgenciesController.to.listAgencies.value =
                      _resp.data['agencias'];
                }
              },
              child: Obx(() => Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    decoration: BoxDecoration(
                        color: index == AgenciesController.to.itemSelected.value
                            ? Colors.white.withOpacity(0.4)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      categories[index]['nombre'],
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
