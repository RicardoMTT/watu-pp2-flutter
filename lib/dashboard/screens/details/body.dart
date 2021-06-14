import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:probardispositivofisico/app_routing/routing.dart';
import 'package:probardispositivofisico/app_widgets/common_successfull_dialog.dart';
import 'package:probardispositivofisico/app_widgets/loading_dialog.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/dashboard/mutations/register_purchase.dart';
import 'package:probardispositivofisico/dashboard/queries/get_product.dart';
import 'package:probardispositivofisico/dashboard/screens/details/details_controller.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:url_launcher/url_launcher.dart';

class Body extends StatefulWidget {
  final String id;
  const Body({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    timeDilation = 4.0;
    iniiaiaia();
    super.initState();
  }

  iniiaiaia() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    bool _largePhoto = false;
    String _url = '';
    Size size = MediaQuery.of(context).size;

    AgencyDetailsController _agencyDetailsController =
        Get.put(AgencyDetailsController());
    void _launchURL() async => await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not launch $_url';
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 500),
      reverse: !_largePhoto,
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return SharedAxisTransition(
          child: child,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
        );
      },
      child: Container(
        child: Query(
          options: QueryOptions(
            document: getAgencia,
            variables: {
              'id': widget.id,
            },
          ),
          builder: (result, {fetchMore, refetch}) {
            if (result.isLoading && result.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            print(result);

            final _item = result.data['agencia'];
            List<dynamic> programasAgency = _item['programas'];
            _url = _item['url'];
            print("ITEM $_item");
            List<Widget> items = [];
            items.add(Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                _item['nombre'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ));
            items.add(Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Descripción',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ));
            items.add(Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                _item['descripcion'],
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              ),
            ));
            items.add(SizedBox(
              height: 10,
            ));
            items.add(Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: _launchURL,
                child: Text(
                  "Url: ${_item['url']}",
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ));
            items.add(SizedBox(
              height: 10,
            ));
            items.add(Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Programas disponibe',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ));
            programasAgency.forEach((element) {
              items.add(Container(
                  height: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 240,
                        child: Column(children: [
                          Text(element['nombre'].toString()),
                          Text(element['descripcion'].toString())
                        ]),
                      ),
                      InkWell(
                        onTap: () {
                          print('VER INFO');
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(100.0)),
                          child: Text(
                            'Ver info',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )));
            });
            items.add(SizedBox(
              height: 15,
            ));
            items.add(Container(
              padding: EdgeInsets.symmetric(horizontal: 90, vertical: 5),
              child: RaisedButton(
                onPressed: () {},
                color: kPrimaryColor,
                textColor: Colors.white,
                child: Text('Reservar'),
              ),
            ));
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  //pinned: true,
                  expandedHeight: 270,
                  flexibleSpace: Image.network(
                    'http://192.168.1.8:1337' + _item['imagen'][0]['url'],
                    width: size.width,
                    height: size.height * 0.70,
                    fit: BoxFit.fill,
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(items),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
