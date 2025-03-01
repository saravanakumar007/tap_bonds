import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_bonds/business_logic/company_list/company_list_cubit.dart';
import 'package:tap_bonds/business_logic/splash/splash_cubit.dart';
import 'package:tap_bonds/injection.dart';
import 'package:tap_bonds/presentation/pages/company_list_page.dart';
import 'package:tap_bonds/presentation/pages/splash_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,

    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<SplashCubit>(),
            child: const SplashPage(),
          );
        },
      ),
      GoRoute(
        path: '/company-list',

        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => getIt<CompanyListCubit>(),
            child: const CompanyListPage(),
          );
        },
      ),
    ],

    // errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}
