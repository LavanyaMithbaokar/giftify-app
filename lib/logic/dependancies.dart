import 'package:get/get.dart';
import 'package:giftify/logic/controller/connectivity.dart';

class DependancyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
