import 'package:flutter/material.dart';
import 'package:sanddune_booking/presentation/screens/desktop_screen.dart';
import 'package:sanddune_booking/presentation/screens/mobile_screen.dart';
import 'package:sanddune_booking/presentation/screens/responsive_layout.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: MobileScreen(),
      desktopBody: DesktopScreen(),
    );
  }
}
