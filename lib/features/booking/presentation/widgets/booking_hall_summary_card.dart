import 'package:flutter/material.dart';

import '../../../../core/constants/font_size.dart';
import '../../../../core/constants/radius.dart';

class BookingHallSummaryCard extends StatelessWidget {
  const BookingHallSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(AppRadius.r16),
            ),
            child: Image.network(
              'https://images.unsplash.com/photo-1519167758481-83f550bb49b3?w=300',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stack) => Container(
                width: 100,
                height: 100,
                color: const Color(0xFFEFEDF3),
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: Color(0xFF9B8EC4),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'قاعة ليلتي الماسية',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: AppFontSize.s15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF250548),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        size: 13,
                        color: Color(0xFF9B8EC4),
                      ),
                      SizedBox(width: 3),
                      Text(
                        'التجمع الخامس، القاهرة',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: AppFontSize.labelSmall,
                          color: Color(0xFF4A454F),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFB800),
                        size: 14,
                      ),
                      const SizedBox(width: 3),
                      const Text(
                        '4.9',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: AppFontSize.labelMedium,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B1B20),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '80,000 ج.م',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: AppFontSize.s13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B1F5E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
