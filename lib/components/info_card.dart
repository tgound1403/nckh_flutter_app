import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard(
      {this.title, this.content});
  final title;
  final content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
      child: Material(
          color: Colors.white,
          elevation: 5,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(content, textAlign: TextAlign.justify, style: TextStyle(fontSize: 16))
              ],
            ),
          )),
    );
  }
}
