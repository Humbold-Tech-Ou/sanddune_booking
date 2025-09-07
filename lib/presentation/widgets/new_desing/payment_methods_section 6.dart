import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/widgets/new_desing/payment_logo.dart';

class PaymentMethodsSection extends StatelessWidget {
  const PaymentMethodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: [
        PaymentLogo('Visa'),
        PaymentLogo('Mastercard'),
        PaymentLogo('Amex'),
        PaymentLogo('PayPal'),
      ],
    );
  }
}
