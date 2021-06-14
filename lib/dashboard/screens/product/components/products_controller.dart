import 'package:get/get.dart';

class AgenciesController extends GetxController {
  final RxList<dynamic> listAgencies = [].obs;
  final itemSelected = 0.obs;

  AgenciesController();
  static AgenciesController get to => Get.find();
}
