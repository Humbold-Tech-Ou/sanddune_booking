import 'package:flutter/material.dart';

class ServicesWrap extends StatelessWidget {
  final List<String> services;
  const ServicesWrap({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: services.map((service) => Chip(label: Text(service))).toList(),
    );
  }
}
