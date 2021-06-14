import 'package:get/get.dart';
import 'package:probardispositivofisico/profile/screens/profile_controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
