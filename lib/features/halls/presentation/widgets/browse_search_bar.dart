import 'package:flutter/material.dart';

import '../../../../core/constants/font_size.dart';
import '../../../../core/constants/radius.dart';

class BrowseSearchBar extends StatelessWidget {
  const BrowseSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.r16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B1F5E).withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(Icons.search_rounded, color: Color(0xFF9B8EC4), size: 22),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'ابحث عن قاعة...',
              style: TextStyle(
                fontSize: AppFontSize.bodyMedium,
                color: Color(0xFF9B8EC4),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF3B1F5E),
              borderRadius: BorderRadius.circular(AppRadius.r10),
            ),
            child: const Icon(
              Icons.tune_rounded,
              color: Colors.white,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
