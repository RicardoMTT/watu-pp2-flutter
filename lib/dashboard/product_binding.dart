import 'package:get/get.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/products_controller.dart';

class AgenciesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AgenciesController());
  }
}
