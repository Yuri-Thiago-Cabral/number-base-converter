import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:converter/utils/constants.dart';
import 'package:converter/utils/functions.dart';
import 'package:converter/view/widgets/input_text_widget.dart';

class ConverterView extends StatefulWidget {
  const ConverterView({super.key, required this.title});

  final String title;

  @override
  State<ConverterView> createState() => _ConverterViewState();
}

class _ConverterViewState extends State<ConverterView> {
  late TextEditingController _controller;
  String selectedItem = 'decimal';

  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: 'decimal', child: Text('decimal')),
    DropdownMenuItem(value: 'binary', child: Text('binário')),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: const Text(
              Constants.appConverterDescription,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 50, left: 50),
            child: Column(
              children: [
                InputTextWidget(
                  controller: _controller,
                  onChanged: (text) {
                    setState(() {
                      _controller.value.text;
                    });
                  },
                  hintText: 'Valor a ser convertido',
                  label: 'Insira um valor para a conversão'
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                DropdownButton(
                  items: menuItems,
                  value: selectedItem,
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value ?? selectedItem;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'DECIMAL',
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: const Color(0xFFD4D1D1),
                  child: Center(
                    child: Text(
                      getDigits(_controller.value.text, selectedItem)[
                              'decimal'] ??
                          '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'BINÁRIO',
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: const Color(0xFFD4D1D1),
                  child: Center(
                    child: Text(
                      getDigits(
                              _controller.value.text, selectedItem)['binary'] ??
                          '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  HashMap<String, String> getDigits(String value, String option) {
    HashMap<String, String> values = HashMap();

    switch (option) {
      case 'decimal':
        values['decimal'] = value;
        values['binary'] = Functions.convertDecimalToBinary(value);
        break;
      case 'binary':
        values['decimal'] = Functions.convertBinaryToDecimal(value);
        values['binary'] = value;
    }

    return values;
  }
}
