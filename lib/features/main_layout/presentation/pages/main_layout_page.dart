import 'package:al_qaah/core/utils/responsive_utils/responsive_container.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:al_qaah/features/booking/presentation/screens/booking_request_screen.dart';
import 'package:al_qaah/features/halls/presentation/screens/browse_screen.dart';
import 'package:flutter/material.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../../core/theme/app_colors.dart';

class MainLayoutPage extends StatefulWidget {
  const MainLayoutPage({super.key});

  @override
  State<MainLayoutPage> createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends State<MainLayoutPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomePage(),
    BrowseScreen(),
    BookingRequestScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final borderRadius = context.sp(6).clamp(24.0, 32.0);

    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: ResponsiveContainer(
        heightPercent: 8,
        minHeight: 64,
        maxHeight: 80,
        decoration: BoxDecoration(
          color: AppColors.primaryContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0, Icons.home_rounded),
            _buildNavItem(1, Icons.explore_rounded),
            _buildNavItem(2, Icons.event_note_rounded),
            _buildNavItem(3, Icons.account_circle_rounded),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    bool isSelected = _currentIndex == index;
    final iconSize = context.sp(7).clamp(26.0, 32.0);
    final padding = context.wp(3).clamp(8.0, 16.0);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => setState(() => _currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.15)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected
              ? Colors.white
              : Colors.white.withValues(alpha: 0.5),
          size: iconSize,
        ),
      ),
    );
  }
}
