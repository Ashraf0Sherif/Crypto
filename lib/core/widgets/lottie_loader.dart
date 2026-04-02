import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import '../../gen/assets.gen.dart';
import '../theme/app_colors.dart';

class LottieLoader extends StatelessWidget {
  const LottieLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryContainer.withValues(alpha: .08),
                  blurRadius: 80,
                  spreadRadius: 10,
                ),
                BoxShadow(
                  color: AppColors.primaryDim.withValues(alpha: .1),
                  blurRadius: 40,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),

          Lottie.asset(
            Assets.animations.lottieLoader,
            width: 160,
            height: 160,
            fit: BoxFit.contain,
            renderCache: RenderCache.drawingCommands,
            delegates: LottieDelegates(
              values: [
                ValueDelegate.color(const [
                  '**',
                  'Fill 1',
                  '**',
                ], value: AppColors.primary),
                ValueDelegate.opacity(
                  const ['**', 'Fill 1', '**'],
                  value: 127,
                ),  
              ],
            ),
          ),
        ],
      ),
    );
  }
}
