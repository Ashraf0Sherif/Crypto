import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/navigator_observer.dart';
import 'core/routing/routes.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
