import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/services/auth_service.dart';
import 'package:doctor_hunt/core/utils/service_locator.dart';
import 'package:doctor_hunt/features/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/auth/data/repos/auth_repo_imp.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/resetpassword/resetpassword_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/signin/signin_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/controller/signup/signup_cubit.dart';
import 'package:doctor_hunt/features/auth/presentation/views/login_view.dart';
import 'package:doctor_hunt/features/auth/presentation/views/sign_up_view.dart';
import 'package:doctor_hunt/features/appointment/presentation/views/appointment_view.dart';
import 'package:doctor_hunt/features/appointment/presentation/views/time_selection_view.dart';
import 'package:doctor_hunt/features/favourite/presentation/views/favourite_view.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/presentation/views/doctor_details.dart';
import 'package:doctor_hunt/features/home/presentation/views/home_view.dart';
import 'package:doctor_hunt/features/main_layout/presentation/views/main_layout.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/role_selection_view.dart';
import 'package:doctor_hunt/features/search/presentation/search_view.dart';
import 'package:doctor_hunt/features/spalsh/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        builder: (context, state) => BlocProvider(
          create: (context) => SigninCubit(authRepo: getIt<AuthRepoImp>()),
          child: SignInView(),
        ),
      ),
      GoRoute(
        path: RouteNames.signUpRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => SignupCubit(authRepo: getIt<AuthRepoImp>()),
          child: SignUpView(),
        ),
      ),
      GoRoute(
        path: RouteNames.mainLayoutRoute,
        builder: (context, state) => MainLayout(user: state.extra as UserModel),
      ),
      GoRoute(
        path: RouteNames.homeRoute,
        builder: (context, state) => HomeView(user: state.extra as UserModel),
      ),
      GoRoute(
        path: RouteNames.doctorDetailsRoute,

        builder: (context, state) =>
            DoctorDetails(doctor: state.extra as DoctorModel),
      ),
      GoRoute(
        path: RouteNames.searchRoute,

        builder: (context, state) => SearchView(),
      ),
      GoRoute(
        path: RouteNames.timeSelectionRoute,

        builder: (context, state) =>
            TimeSelectionView(doctor: state.extra as DoctorModel),
      ),
      GoRoute(
        path: RouteNames.appointmentRoute,

        builder: (context, state) => AppointmentView(),
      ),
      GoRoute(
        path: RouteNames.favouriteRoute,

        builder: (context, state) => FavouriteView(),
      ),
    ],
  );
}
