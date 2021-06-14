import 'package:get/get.dart';
import 'package:probardispositivofisico/dashboard/dashboard_controller.dart';

class TabsScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(() => TabsController());
  }
}
