import 'dart:async';

import 'package:flutter/material.dart';

import '../home.dart';

part 'events.dart';

typedef PageStack = List<Widget>;

class NavigationBLoC {
  final PageStack _stack = [const Home()];

  final StreamController<PageStack> _controller = StreamController();

  Stream<PageStack> get stream => _controller.stream;

  StreamSink<PageStack> get _sink => _controller.sink;

  final StreamController<NavigationEvent> _eventController = StreamController();

  Sink<NavigationEvent> get eventSink => _eventController.sink;

  NavigationBLoC() {
      _sink.add(_stack);
    _eventController.stream.listen(_eventHandler);
  }

  void _eventHandler(NavigationEvent event) {
    if (event is Pop) {
      if (_stack.length > 1) {
        debugPrint("pages in stack ===> ${_stack.length}");
        _stack.removeLast();
      }
    } else if (event is Push) {
      _stack.add(event.page);
    }
    _sink.add(_stack);
  }
}
