import 'package:boiler_plate/view/screens.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { portfolio,  }

// flutter packages pub run build_runner build --delete-conflicting-outputs
final routers = [
  GoRoute(
    path: '/',
    name: AppRoute.portfolio.name,
    builder: (context, state) => const PortfolioScreen(),
  ),
 
];
