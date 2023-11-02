import 'package:flutter/material.dart';

class InputThemes {
  InputDecorationTheme theme() => const InputDecorationTheme(
        contentPadding: EdgeInsets.all(16),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(width: 2)),
        counterStyle: TextStyle(fontSize: 0),
      );
}
