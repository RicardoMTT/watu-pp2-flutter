import 'package:animations/animations.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:probardispositivofisico/components/search_box.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/dashboard/queries/get_all_products.dart';
import 'package:probardispositivofisico/dashboard/screens/details/details_screen.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/category_list.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/product_card.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/products_controller.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  initState() {
    // timeDilation = 4.0;
    //iniiaiaia();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  iniiaiaia() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBox(),
        CategoryList(),
        SizedBox(height: kDefaultPadding / 2),
        Expanded(
          child: Query(
            options: QueryOptions(
                document: getAllAgenciesQuery,
                fetchPolicy: FetchPolicy.networkOnly),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading && result.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final List<dynamic> listAgencies = result.data['agencias'];
                // _AgenciesController.listProducts.value = listProducts;

                // Esta funcion se ejecuta al terminar de hacer build del widget, con lo anterior se ejecutaba al momento de buildear xd
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  AgenciesController.to.listAgencies.value = listAgencies;
                });
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 70),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                    Container(child: Obx(
                      () {
                        return AgenciesController.to.listAgencies.length <= 0
                            ? Container(
                                child: Center(
                                  child: Text(
                                      'No existe agencia de esta categoria'),
                                ),
                              )
                            : Container(
                                child: ListView.builder(
                                  itemCount: AgenciesController
                                      .to.listAgencies.value.length,
                                  itemBuilder: (context, index) => Container(
                                    child: OpenContainer(
                                      closedElevation: 0.0,
                                      openElevation: 0.0,
                                      closedShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0.0))),
                                      transitionType:
                                          ContainerTransitionType.fadeThrough,
                                      closedBuilder: (BuildContext _,
                                          VoidCallback openContainer) {
                                        return Container(
                                          width: 200,
                                          margin: EdgeInsets.only(
                                              bottom: 30, left: 5),
                                          child: AgencyCard(
                                            itemIndex:
                                                int.parse(index.toString()),
                                            product: AgenciesController
                                                    .to.listAgencies.value[
                                                int.parse(index.toString())],
                                          ),
                                        );
                                      },
                                      openBuilder:
                                          (BuildContext _, VoidCallback __) {
                                        return DetailsScreen(
                                          id: AgenciesController.to.listAgencies
                                              .value[index]['id'],
                                        );
                                      },
                                      onClosed: (_) => print('Closed'),
                                    ),
                                  ),
                                ),
                              );
                      },
                    ))
                  ],
                );
              }
            },
          ),
        )
      ],
    );
  }
}
