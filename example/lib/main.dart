import 'package:flutter/material.dart';
import 'package:ninja_toolkit/ninja_toolkit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: NetFlowPage(
              disconnectionMessage: "InterNet Disconnected",
              status: PageStatus.error,
              errorMessage: "Somthing Went Wrong",
              child: Center(
                child: Text("Sasa"),
              )),
        ),
      ),
    );
  }
}
