import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/dashboard/screens/details/body.dart';

class DetailsScreen extends StatelessWidget {
  final id;
  const DetailsScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ID $id");
    return SafeArea(
      child: Scaffold(
          backgroundColor: kPrimaryColor,
          // appBar: AppBar(
          //   backgroundColor: kPrimaryColor,
          //   title: Text(
          //     'Detalles de la agencia',
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   elevation: 0,
          // ),
          body: Body(
            id: id,
          )),
    );
  }
}
