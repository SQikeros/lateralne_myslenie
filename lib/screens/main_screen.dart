import 'dart:ui';
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

  final List<Widget> _screens = const [MenuTab(), AboutAuthorTab()];

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, bottomInset > 0 ? bottomInset : 12),
        child: _GlassBottomNav(currentIndex: _currentIndex, onChanged: (i) => setState(() => _currentIndex = i)),
      ),
    );
  }
}

class _GlassBottomNav extends StatelessWidget {
  const _GlassBottomNav({required this.currentIndex, required this.onChanged});

  final int currentIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    const active = Color(0xFF6366F1);

    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          height: 68,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.65),
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: Colors.white.withOpacity(0.7)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 28, offset: const Offset(0, 14))],
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeOutCubic,
                alignment: currentIndex == 0 ? Alignment.centerLeft : Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  heightFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(color: active.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: _NavItem(isActive: currentIndex == 0, icon: Icons.grid_view_rounded, label: 'Techniki', onTap: () => onChanged(0)),
                  ),
                  Expanded(
                    child: _NavItem(isActive: currentIndex == 1, icon: Icons.person_rounded, label: 'O Autorze', onTap: () => onChanged(1)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.isActive, required this.icon, required this.label, required this.onTap});

  final bool isActive;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const active = Color(0xFF6366F1);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              scale: isActive ? 1.06 : 1.0,
              child: Icon(icon, size: 22, color: isActive ? active : Colors.grey.shade700),
            ),
            const SizedBox(width: 8),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              style: TextStyle(fontSize: 13, fontWeight: isActive ? FontWeight.w800 : FontWeight.w600, color: isActive ? active : Colors.grey.shade700),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
