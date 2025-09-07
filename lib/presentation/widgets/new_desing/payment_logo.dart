import 'package:flutter/material.dart';

class PaymentLogo extends StatelessWidget {
  final String name;
  const PaymentLogo(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
