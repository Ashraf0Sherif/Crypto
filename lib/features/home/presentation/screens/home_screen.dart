import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../../data/models/coin_data.dart';
import '../widgets/action_card.dart';
import '../widgets/coin_section.dart';
import '../widgets/home_top_bar.dart';
import '../widgets/nav_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

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
      body: SafeArea(
        child: SingleChildScrollView(
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
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                    ActionCard(
                      icon: Icons.credit_card_rounded,
                      title: 'Credit/Debit Card',
                      subtitle: 'Visa, Mastercard',
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border(
            top: BorderSide(color: AppColors.ghostBorder, width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: (index) => setState(() => _currentTab = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.onSurfaceMuted,
          selectedLabelStyle: AppTextStyles.labelSm.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: AppTextStyles.labelSm,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset(Assets.svgs.home.path, width: 22, height: 22, colorFilter: const ColorFilter.mode(AppColors.onSurfaceMuted, BlendMode.srcIn)),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset(Assets.svgs.home.path, width: 32, height: 32, colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset(Assets.svgs.market.path, width: 22, height: 22, colorFilter: const ColorFilter.mode(AppColors.onSurfaceMuted, BlendMode.srcIn)),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset(Assets.svgs.market.path, width: 32, height: 32, colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
              ),
              label: 'Markets',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset(Assets.svgs.trades.path, width: 22, height: 22, colorFilter: const ColorFilter.mode(AppColors.onSurfaceMuted, BlendMode.srcIn)),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset(Assets.svgs.trades.path, width: 32, height: 32, colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
              ),
              label: 'Trades',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset(Assets.svgs.activity.path, width: 22, height: 22, colorFilter: const ColorFilter.mode(AppColors.onSurfaceMuted, BlendMode.srcIn)),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset(Assets.svgs.activity.path, width: 32, height: 32, colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
              ),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset(Assets.svgs.wallet.path, width: 22, height: 22, colorFilter: const ColorFilter.mode(AppColors.onSurfaceMuted, BlendMode.srcIn)),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SvgPicture.asset(Assets.svgs.wallet.path, width: 32, height: 32, colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
              ),
              label: 'Wallets',
            ),
          ],
        ),
      ),
    );
  }
}
