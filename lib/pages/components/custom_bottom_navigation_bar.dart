import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salat_tracker/landing_page.dart';
import 'package:salat_tracker/pages/salat_not_prayed.dart';
import 'package:salat_tracker/providers/bottom_navigator_provider.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    bool isSelected = context.read<BottomNavigatorProvider>().selected == index;

    return GestureDetector(
      onTap: () {
        if (isSelected) return;

        context.read<BottomNavigatorProvider>().setSelected(index);
        if (index == 0) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LandingPage()),
            (Route<dynamic> route) => false,
          );
        }
        if (index == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SalatNotPrayed()));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: isSelected
            ? BoxDecoration(
                color: const Color(0xFF285CEC),
                borderRadius: BorderRadius.circular(20.0),
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFDFE7FD),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildBottomNavItem(Icons.home, 'Home', 0),
          _buildBottomNavItem(Icons.block, 'Not Prayed', 1),
          _buildBottomNavItem(Icons.bar_chart, 'Stats', 2),
          _buildBottomNavItem(Icons.settings, 'Settings', 3),
        ],
      ),
    );
  }
}
