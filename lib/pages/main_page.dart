import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giftify/logic/bloc/splash_bloc.dart';
import 'package:giftify/logic/bloc/splash_state.dart';
import 'package:giftify/pages/homepage.dart';
import 'package:giftify/pages/login.dart';
import 'package:giftify/pages/signup.dart';
import 'package:giftify/pages/splash.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, InitialState>(
      builder: (context, state) {
        if (state is SplashState) {
          return SplashPages();
        } else if (state is AuthState) {
          return Login();
        } else if (state is HomeState) {
          return HomePage();
        } else {
          return SplashPages();
        }
      },
    );
  }
}
