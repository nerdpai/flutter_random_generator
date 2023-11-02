import 'dart:math';

import 'package:flutter/material.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({super.key, required min, required max})
      : _min = min,
        _max = max;

  final int _min, _max;

  @override
  State<RandomNumberPage> createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  final Random rand = Random();
  String generated = '↓Press the Button↓';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Generator',
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            generated =
                (rand.nextInt(widget._max - widget._min + 1) + widget._min)
                    .toString();
          });
        },
        label: const Text(
          'Generate',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Text(
          generated,
          style: const TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
