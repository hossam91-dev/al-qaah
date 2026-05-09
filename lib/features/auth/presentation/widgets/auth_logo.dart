import 'package:flutter/material.dart';
import '../../../../core/constants/font_size.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils/responsive_helper.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: context.hp(1.5)),
          Text(
            'LAFAF',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppColors.primary,
              letterSpacing: 4.0,
              fontSize: AppFontSize.displayMedium,
            ),
          ),
          Container(
            height: 2,
            width: context.wp(10).clamp(30.0, 60.0),
            color: AppColors.primary,
            margin: EdgeInsets.only(top: context.hp(1)),
          ),
        ],
      ),
    );
  }
}
