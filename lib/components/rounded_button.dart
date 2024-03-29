import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {this.corner, this.color, this.textColor, this.title, this.function});
  final color;
  final title;
  final function;
  final textColor;
  final corner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: corner,
        child: MaterialButton(
          onPressed: function,
          minWidth: 120.0,
          height: 32.0,
          child: Text(title, style: TextStyle(fontSize: 18, color: textColor, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
