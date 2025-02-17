import 'package:flutter/material.dart';
import 'package:kwikshop/config/theme/app_colors.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: size.height * .65,
            left: size.width * .21,
            child: CustomPaint(
              painter: Bubble(
                radius: 50,
                color1: AppColors.primaryColor,
                color2: AppColors.transparentColor,
              ),
            ),
          ),
          Positioned(
            top: size.height * .98,
            left: size.width * .1,
            child: CustomPaint(
              painter: Bubble(
                radius: 170 - 30,
                color1: AppColors.primaryColor,
                color2: AppColors.transparentColor,
              ),
            ),
          ),
          Positioned(
            top: size.height * .5,
            left: size.width * 0.8,
            child: CustomPaint(
              painter: Bubble(
                radius: 30,
                color1: AppColors.primaryColor,
                color2: AppColors.transparentColor,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.4,
            left: size.width * 0.35,
            child: CustomPaint(
              painter: Bubble(
                radius: 60,
                color1: AppColors.primaryColor,
                color2: AppColors.transparentColor,
              ),
            ),
          ),
          Positioned(
            top: size.height * .1,
            left: size.width * .8,
            child: CustomPaint(
              painter: Bubble(
                radius: 170,
                color1: AppColors.primaryColor,
                color2: AppColors.transparentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Bubble extends CustomPainter {
  const Bubble(
      {required this.radius, required this.color2, required this.color1});
  final double radius;
  final Color color1;
  final Color color2;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [color1, color2],
      ).createShader(
        Rect.fromCircle(
          center: const Offset(0, 0),
          radius: radius,
        ),
      );

    canvas.drawCircle(const Offset(0, 0), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
