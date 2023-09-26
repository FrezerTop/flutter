import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const RandomNumApp());
}

class RandomNumApp extends StatelessWidget {
  const RandomNumApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Number',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 213, 255, 165)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Случайное число'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int minNum = 0;
  int maxNum = 0;

  int randomNum = 0;

  int randomRange(int min, int max) {
    return min + Random().nextInt((max + 1) - min);
  }

  void _getRandomNumber() {
    setState(() {
      randomNum = randomRange(minNum, maxNum);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 70, bottom: 50),
              child: Column(children: [
                Text(
                  'Случайное число: $randomNum',
                  style: TextStyle(fontSize: 34),
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(left: 100, right: 100, bottom: 50),
              child: Column(children: [
                TextField(
                  onChanged: (val) {
                    minNum = int.parse(val);
                  },
                  decoration: InputDecoration(labelText: 'Минимум'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                Container(
                  height: 30,
                ),
                TextField(
                  onChanged: (val) {
                    maxNum = int.parse(val);
                  },
                  decoration: InputDecoration(labelText: 'Максимум'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              height: 50,
              child: ElevatedButton(
                onPressed: _getRandomNumber,
                child: const Text('Сгенерировать число',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
