import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftify/data/storage/user_data.dart';
import 'package:giftify/logic/bloc/splash_state.dart';
import 'package:giftify/logic/provider/user.dart';

class SplashBloc extends Cubit<InitialState> {
  SplashBloc() : super(SplashState());

  Future<void> appStart() async {
    UserStore userStore = await UserStore();
    final validState = await userStore.loadData();

    await Future.delayed(Duration(seconds: 2));
    print(validState.email);
    if (validState.email != null && validState.email!.isNotEmpty) {
      emit(HomeState());
    } else {
      emit(AuthState());
    }
  }
}
