import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/theme/app_colors.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'LAFAF',
            style: GoogleFonts.notoSerif(
              fontSize: 42,
              fontWeight: FontWeight.bold,
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
