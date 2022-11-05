import 'package:flutter/material.dart';
import 'package:nav_test/bLoC/bLoC.dart';

class Provider extends InheritedWidget {
  final NavigationBLoC? bLoC;

  const Provider({
    super.key,
    required super.child,
    required this.bLoC,
  });

  static NavigationBLoC? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<Provider>()?.bLoC;
  }

  @override
  bool updateShouldNotify(covariant Provider oldWidget) => true;
}
