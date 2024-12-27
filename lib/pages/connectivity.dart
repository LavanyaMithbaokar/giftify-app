import 'package:flutter/material.dart';

class ConnectivityPage extends StatefulWidget {
  const ConnectivityPage({super.key});

  @override
  State<ConnectivityPage> createState() => _ConnectivityState();
}

class _ConnectivityState extends State<ConnectivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("no connection"),
      ),
    );
  }
}
