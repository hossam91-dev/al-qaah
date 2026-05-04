import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.wp(4),
          vertical: context.hp(1.5),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: context.sp(5).clamp(18.0, 24.0),
              color: AppColors.secondary,
            ),
            SizedBox(width: context.wp(3)),
            Expanded(
              child: ResponsiveText(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurface,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: context.sp(3.5).clamp(12.0, 16.0),
              color: AppColors.outline.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
