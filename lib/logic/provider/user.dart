import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'package:giftify/data/model/auth.dart';
import 'package:giftify/data/storage/user_data.dart';

class UserDataManager extends StateNotifier<UserModel> {
  UserDataManager() : super(UserModel());
  UserStore _userStore = UserStore();

  Future<UserModel> loadDataState() async {
    try {
      _userStore.loadData().then((value) {
        state = value;
      });
    } catch (e) {
      Get.snackbar("stoe error", e.toString());
      return UserModel();
    }
    return state;
  }

  Future<void> updateDataState(UserModel userModel) async {
    state = userModel;

    print("data has store");
    await _userStore.updateData(userModel);
  }

  Future<void> deleteDataState() async {
    state = UserModel();
    await _userStore.deleteData();
  }
}

final userStateProvider = StateNotifierProvider<UserDataManager, UserModel>(
  (ref) {
    return UserDataManager();
  },
);
