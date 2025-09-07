import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/screens/desktop_details.dart';
import 'package:sanddune_booking/presentation/screens/responsive_layout.dart';
import 'package:sanddune_booking/presentation/screens/mobile_details.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MobileDetails(),
      desktopBody: DesktopDetails(),
    );
  }
}

// Mobile implementation moved to separate file: mobile_details.dart
