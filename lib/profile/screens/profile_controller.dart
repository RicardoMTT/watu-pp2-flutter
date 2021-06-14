import 'dart:io';

import 'package:get/get.dart';

class ProfileController extends GetxController {
  final itemSelected = 0.obs;
  final fileRx = Rx<File>();

  ProfileController();
  static ProfileController get to => Get.find();
}
