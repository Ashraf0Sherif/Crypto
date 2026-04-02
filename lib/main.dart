import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/navigator_observer.dart';
import 'core/routing/routes.dart';
import 'core/theme/app_theme.dart';
import 'hive_registrar.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapters();
  await setupGetIt();
  runApp(Crypto(appRouter: AppRouter()));
}

class Crypto extends StatelessWidget {
  const Crypto({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: Routes.splash,
      onGenerateRoute: appRouter.onGenerateRoute,
      navigatorObservers: [CryptoNavigatorObserver()],
    );
  }
}
