import 'package:animations/animations.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:probardispositivofisico/app_routing/routing.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/components/search_delegate.dart';
import 'package:probardispositivofisico/dashboard/screens/details/details_screen.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/product_card.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/products_controller.dart';

class SearchBox extends StatelessWidget {
  SearchBox({
    Key key,
  }) : super(key: key);

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AgenciesController _agenciesController = Get.find<AgenciesController>();

    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20.0)),
      child: TextField(
        style: TextStyle(color: Colors.white),
        onTap: () async {
          List<dynamic> agencies = _agenciesController.listAgencies.value;
          List<String> names = [];
          agencies.forEach((element) {
            names.add(element['nombre']);
          });
          final name =
              await showSearch(context: context, delegate: NameSearch(names));
          if (name != null) {
            var item;
            agencies.forEach((element) {
              if (element['nombre'] == name) {
                item = element;
              }
            });

            OpenContainer(
              transitionType: ContainerTransitionType.fadeThrough,
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                return AgencyCard(
                  itemIndex: 0,
                  product: item,
                );
              },
              openBuilder: (BuildContext _, VoidCallback __) {
                return DetailsScreen(id: item['id']);
              },
              onClosed: (_) => print('Closed'),
            );
            // Get.to(DetailsScreen(), arguments: [
            //   item['id'],
            // ]);
            // Get.to(() => DetailsScreen(), arguments: [
            //   item['id'],
            //   item['precio'],
            // ]);
          }
        },
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            icon: SvgPicture.asset('assets/icons/search.svg'),
            hintText: 'Search'),
      ),
    );
  }
}
