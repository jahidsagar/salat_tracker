import 'package:flutter/material.dart';

import 'components/custom_bottom_navigation_bar.dart';

class SalatNotPrayed extends StatelessWidget {
  const SalatNotPrayed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Prayed'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
