import 'package:coffe_challenge/src/notifier/coffe_notifier.dart';
import 'package:flutter/material.dart';

class CoffeInheritedWidget extends InheritedWidget {
  final CoffesNotifier notifier;
  final Widget child;

  CoffeInheritedWidget({@required this.notifier, @required this.child}) : super(child: child);

  static CoffeInheritedWidget of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<CoffeInheritedWidget>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
