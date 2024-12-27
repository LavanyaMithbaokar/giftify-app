import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giftify/pages/connectivity.dart';
import 'package:giftify/pages/homepage.dart';

class NetworkController extends GetxController {
  BuildContext? context;
  NetworkController({this.context});
  final Connectivity _connectivity = Connectivity();

  bool firstStateNetwork = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResults) {
    if (connectivityResults.first == ConnectivityResult.none) {
      firstStateNetwork = true;
      Get.to(() => const ConnectivityPage(), transition: Transition.fade);
      snackBar("Network Offline", true);
    } else {
      Get.back();
      firstStateNetwork ? snackBar("Back Online", false) : null;
    }
  }

  Future<void> checkConnection() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    _updateConnectionStatus(connectivityResult);
  }

  void snackBar(String text, bool isOnline) {
    Get.snackbar('Connection status', text,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: !isOnline ? Colors.amber : Colors.black,
        margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5));
  }
}
