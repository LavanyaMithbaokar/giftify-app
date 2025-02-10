import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressPro extends StateNotifier<GlobalKey<FormState>> {
  AddressPro() : super(GlobalKey<FormState>());
  void setup(GlobalKey<FormState> formkey) {
    state = formkey;
  }

  GlobalKey<FormState> getState() {
    return state;
  }
}

final addressPro = StateNotifierProvider<AddressPro, GlobalKey<FormState>>(
    (ref) => AddressPro());
