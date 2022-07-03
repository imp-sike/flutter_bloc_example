import 'package:flutter/material.dart';

void main() => runApp(BaseApp());

class BaseApp extends StatelessWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Counter Base App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Counter value: 1",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: Colors.green,
                  padding: const EdgeInsets.all(20),
                  onPressed: () {},
                  child: const Text("+ increment"),
                ),
                MaterialButton(
                  color: Colors.green,
                  padding: const EdgeInsets.all(20),
                  onPressed: () {},
                  child: const Text("- decrement"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
