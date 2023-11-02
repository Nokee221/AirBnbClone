import 'package:flutter_airbnb/screens/booking-details.dart';
import 'package:flutter_airbnb/screens/home_screen.dart';
import 'package:flutter_airbnb/shared/theme/colors.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      name: 'booking-details',
      path: '/booking-details',
      pageBuilder: (context, state) {
        return CustomTransitionPage<void>(
            key: state.pageKey,
            opaque: false,
            barrierColor: appBlack.withOpacity(0.5),
            transitionDuration: const Duration(microseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
            child: const BookingDetailsScreen());
      },
    ),
  ]);
}
