part of 'bLoC.dart';
abstract class NavigationEvent {
  const NavigationEvent();
}

class Pop implements NavigationEvent {
  const Pop();
}

class Push implements NavigationEvent {
  final Widget page;
  const Push(this.page);
}