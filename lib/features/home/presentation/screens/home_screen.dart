import 'package:crypto_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/coin_data.dart';
import '../widgets/action_card.dart';
import '../widgets/coin_section.dart';
import '../widgets/home_top_bar.dart';
import '../widgets/nav_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<CoinData> _recentCoins = const [
    CoinData(
      value: '40,059.83',
      pair: 'BTC/BUSD',
      change: '+0.81%',
      icon: 'assets/svgs/Bitcoin (BTC).svg',
      isPositive: true,
    ),
    CoinData(
      value: '2,059.83',
      pair: 'SOL/BUSD',
      change: '-0.81%',
      icon: 'assets/svgs/Solana (SOL).svg',
      isPositive: false,
    ),
    CoinData(
      value: '40,059.83',
      pair: 'BTC/USDT',
      change: '+1.24%',
      icon: 'assets/svgs/Bitcoin (BTC).svg',
      isPositive: true,
    ),
  ];

  final List<CoinData> _topCoins = const [
    CoinData(
      value: '40,059.83',
      pair: 'MFT/BUSD',
      change: '+0.81%',
      icon: 'assets/svgs/Hifi Finance (MFT).svg',
      isPositive: true,
    ),
    CoinData(
      value: '2,059.83',
      pair: 'REN/BUSD',
      change: '-0.81%',
      icon: 'assets/svgs/Ren (REN).svg',
      isPositive: false,
    ),
    CoinData(
      value: '40,059.83',
      pair: 'ADA/BUSD',
      change: '+2.15%',
      icon: 'assets/svgs/Cardano (ADA).svg',
      isPositive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeTopBar(),
                  const SizedBox(height: 16),
                  const NavGrid(),
                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        ActionCard(
                          icon: Icons.rocket_launch_rounded,
                          title: 'P2P Trading',
                          subtitle: 'Bank Transfer, Paypal Revolut...',
                          useGradientBackground: true,
                          onTap: () {},
                        ),
                        const SizedBox(height: 16),
                        ActionCard(
                          icon: Icons.credit_card_rounded,
                          title: 'Credit/Debit Card',
                          subtitle: 'Visa, Mastercard',
                          useGradientBackground: false,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                  CoinSection(title: 'Recent Coin', coins: _recentCoins),
                  const SizedBox(height: 24),
                  CoinSection(title: 'Top Coins', coins: _topCoins),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
