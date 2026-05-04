import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChange;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return FluidNavBar(
      icons: [
        FluidNavBarIcon(icon: Icons.home),
        FluidNavBarIcon(icon: Icons.access_time),
        FluidNavBarIcon(icon: Icons.menu_book),
        FluidNavBarIcon(icon: Icons.note_add),
      ],

      defaultIndex: selectedIndex,

      onChange: (index) {
        onChange(index);
      },

      style: FluidNavBarStyle(
        barBackgroundColor: Color(0xFF0F172A),
        iconSelectedForegroundColor: Colors.white,
      ),
    );
  }
}