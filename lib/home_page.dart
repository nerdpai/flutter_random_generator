import 'package:flutter/material.dart';

import 'number_forms.dart';
import 'random_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final _controllerMin = TextEditingController();

  final _controllerMax = TextEditingController();

  @override
  void dispose() {
    _controllerMax.dispose();
    _controllerMin.dispose();

    super.dispose();
  }

  String? _numberValidate(String? value) {
    if (value == null || value.isEmpty || RegExp(r'[^0-9]+').hasMatch(value)) {
      return 'Not a number';
    }

    int? max = int.tryParse(_controllerMax.text);
    int? min = int.tryParse(_controllerMin.text);
    int? val = int.tryParse(value);
    if (max != null && min != null && min > max && min == val) {
      return 'Min greater then max';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Range'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Wrong input',
                ),
              ),
            );
          } else {
            int? max = int.tryParse(_controllerMax.text);
            int? min = int.tryParse(_controllerMin.text);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RandomNumberPage(
                  min: min,
                  max: max,
                ),
              ),
            );
          }
        },
        child: const Icon(
          Icons.arrow_forward,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  NumbetFormField(
                      label: 'min',
                      validator: _numberValidate,
                      controller: _controllerMin),
                  const SizedBox(
                    height: 16,
                  ),
                  NumbetFormField(
                      label: 'max',
                      validator: _numberValidate,
                      controller: _controllerMax),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
