import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/features/auth/presentation/views/login_view.dart';
import 'package:doctor_hunt/features/auth/presentation/views/sign_up_view.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/role_selection_view.dart';
import 'package:doctor_hunt/features/spalsh/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RouteNames.splashRoute,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: RouteNames.onBoardingRoute,
        builder: (context, state) => OnBoardingView(),
      ),
      GoRoute(
        path: RouteNames.roleSelectionRoute,
        builder: (context, state) => RoleSelectionView(),
      ),
      GoRoute(
        path: RouteNames.signInRoute,
        builder: (context, state) => SignInView(),
      ),
      GoRoute(
        path: RouteNames.signUpRoute,
        builder: (context, state) => SignUpView(),
      ),
    ],
  );
}
