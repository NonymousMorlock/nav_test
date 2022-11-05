import 'package:flutter/material.dart';
import 'package:nav_test/bLoC/bLoC.dart';
import 'package:nav_test/dashboard.dart';
import 'package:nav_test/provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      bLoC: NavigationBLoC(),
      child: MaterialApp(
        home: const DashBoard(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueGrey,
        ),
      ),
    );
  }
}
