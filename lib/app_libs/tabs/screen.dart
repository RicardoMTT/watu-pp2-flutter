import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:probardispositivofisico/app_widgets/bottom_navigation_bar.dart';
import 'package:probardispositivofisico/dashboard/screens/product/products_screen.dart';
import 'package:probardispositivofisico/history/screens/screen.dart';
import 'package:probardispositivofisico/profile/screens/screen.dart';
import 'package:probardispositivofisico/reservations/screens/screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final _selectedTab = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: _selectedTab.value,
            children: [
              const AgenciesScreen(),
              const ReservationScreen(),
              const ProfileScreen(),
            ],
          )),
      bottomNavigationBar: Obx(() => CommonBottomNavigationBar(
            currentIndex: _selectedTab.value,
            onChangeTab: (index) => _selectedTab.value = index,
          )),
    );
  }
}
