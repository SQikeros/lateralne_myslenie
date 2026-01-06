import 'package:flutter/material.dart';
import 'menu_tab.dart';
import 'about_author_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [const MenuTab(), const AboutAuthorTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2))],
        ),
        child: SafeArea(
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF6366F1),
            unselectedItemColor: Colors.grey[600],
            selectedFontSize: 14,
            unselectedFontSize: 12,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.games), label: 'Techniki'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'O Autorze'),
            ],
          ),
        ),
      ),
    );
  }
}
