import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  final String hintText;
  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function onChanged;

  const InputTextWidget({
    super.key,
    required this.hintText,
    required this.label,
    required this.keyboardType,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        widget.onChanged(text);
      },
      controller:  widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.label,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }
}
