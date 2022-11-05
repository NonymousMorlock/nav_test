import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nav_test/provider/provider.dart';

import 'bLoC/bLoC.dart';
import 'home.dart';
const colours = [
  Colors.orange,
  Colors.yellow,
  Colors.blueGrey,
  Colors.purple,
  Colors.deepPurple,
  Colors.teal,
  Colors.brown,
  Colors.black87,
];
class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  List<Widget> get pages => List.generate(
        8,
        (index) => Container(
          height: double.maxFinite,
          color: colours[index],
          child: Center(
            child: Text(
              index.toString(),
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<List<Widget>>(
            stream: Provider.of(context)?.stream,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Top Side",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Provider.of(context)
                                    ?.eventSink
                                    .add(const Pop());
                              },
                              child: const Text("Pop"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.red,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Left Side",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Provider.of(context)
                                          ?.eventSink
                                          .add(Push(pages[Random().nextInt(pages.length)]));
                                    },
                                    child: const Text("Push"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: snapshot.data?.last ?? const Home(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
