import 'package:flutter/material.dart';

class NumbetFormField extends StatelessWidget {
  const NumbetFormField({
    super.key,
    required String label,
    required validator,
    required controller,
  })  : _label = label,
        _validator = validator,
        _controller = controller;

  final String _label;
  final String? Function(String?) _validator;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validator,
      maxLength: 5,
      controller: _controller,
      decoration: InputDecoration(
        labelText: _label,
        helperText: '',
      ),
    );
  }
}
