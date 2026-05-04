import 'package:al_qaah/core/utils/responsive_utils/responsive_text.dart';
import 'package:al_qaah/core/utils/responsive_utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String phone;
  final String imageUrl;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.phone,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final profileImageSize = context.sp(25).clamp(80.0, 120.0);
    return Container(
      width: double.infinity,
      height: context.hp(35).clamp(240.0, 320.0),
      decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -context.hp(5),
            left: -context.wp(10),
            child: Container(
              width: context.wp(50).clamp(150.0, 250.0),
              height: context.wp(50).clamp(150.0, 250.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -context.hp(3),
            right: -context.wp(5),
            child: Container(
              width: context.wp(40).clamp(120.0, 200.0),
              height: context.wp(40).clamp(120.0, 200.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: profileImageSize,
                      height: profileImageSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(context.wp(1.5)),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit,
                          size: context.sp(3.5).clamp(12.0, 16.0),
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.hp(2)),
                ResponsiveText(
                  name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: context.hp(0.5)),
                ResponsiveText(
                  phone,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
