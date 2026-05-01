import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            'LAFAF',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppColors.primary,
              letterSpacing: 4.0,
            ),
          ),
          Container(
            height: 2,
            width: 40,
            color: AppColors.primary,
            margin: const EdgeInsets.only(top: 8),
          ),
        ],
      ),
    );
  }
}
