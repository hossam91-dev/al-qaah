import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class HomeActionCards extends StatelessWidget {
  const HomeActionCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ActionCard(
          title: 'تصفح القاعات',
          subtitle: 'استكشف تشكيلتنا المختارة من أفخم دور المناسبات',
          buttonText: 'استكشف الآن',
          icon: Icons.grid_view_rounded,
          onTap: () {},
          gradient: const LinearGradient(
            colors: [Color(0xFF250548), Color(0xFF3B1F5E)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        const SizedBox(height: 16),
        _ActionCard(
          title: 'احنا نختارلك',
          subtitle:
              'دعي منسقينا المحترفين يجدون لك القاعة المثالية بناءً على ذوقك وميزانيتك',
          buttonText: 'ابدئي التجربة الذكية',
          icon: Icons.auto_awesome_rounded,
          onTap: () {},
          color: const Color(0xFFFAF8FE),
          borderColor: const Color(0xFFE9E7ED),
          titleColor: AppColors.primary,
          iconColor: AppColors.primary,
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final IconData icon;
  final VoidCallback onTap;
  final Gradient? gradient;
  final Color? color;
  final Color? borderColor;
  final Color titleColor;
  final Color iconColor;

  const _ActionCard({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.icon,
    required this.onTap,
    this.gradient,
    this.color,
    this.borderColor,
    this.titleColor = Colors.white,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: BorderRadius.circular(24),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor.withValues(alpha: 0.8), size: 32),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: titleColor.withValues(alpha: 0.7),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  buttonText,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.arrow_forward_rounded, color: titleColor, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
