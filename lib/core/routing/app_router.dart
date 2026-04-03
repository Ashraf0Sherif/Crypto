import 'package:crypto_app/features/bottom_nav/presentation/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/logic/auth_cubit.dart';
import '../../features/coin_details/logic/coin_details_cubit.dart';
import '../../features/coin_details/presentation/screens/coin_details_screen.dart';
import '../../features/home/logic/home_cubit.dart';
import '../di/dependency_injection.dart';

import '../../features/bottom_nav/logic/bottom_nav_cubit.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/auth/presentation/screens/auth_screen.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case Routes.onboarding:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.settings:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SettingsScreen(),
        );
      case Routes.auth:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const AuthScreen(),
          ),
        );
      case Routes.nav:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => BottomNavCubit()),
              BlocProvider(
                create: (context) => getIt<HomeCubit>()..getCoinsMarkets(),
              ),
            ],
            child: const BottomNavScreen(),
          ),
        );
      case Routes.coinDetails:
        final coinId = settings.arguments as String;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => getIt<CoinDetailsCubit>()..getCoinData(coinId: coinId),
            child: CoinDetailsScreen(coinId: coinId),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found!'))),
        );
    }
  }
}

