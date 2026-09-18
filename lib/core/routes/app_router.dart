import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/services/shared_prefrence_services.dart';
import 'package:doctor_hunt/features/admin/doctors/create_doctor/presentation/create_doctor_view.dart';
import 'package:doctor_hunt/features/common/auth/data/services/auth_service.dart';
import 'package:doctor_hunt/service_locator.dart';
import 'package:doctor_hunt/features/admin/admin_layout/presentation/admin_layout.dart';
import 'package:doctor_hunt/features/common/auth/data/models/user_model.dart';
import 'package:doctor_hunt/features/common/auth/data/repos/auth_repo_imp.dart';
import 'package:doctor_hunt/features/common/auth/presentation/controller/resetpassword/resetpassword_cubit.dart';
import 'package:doctor_hunt/features/common/auth/presentation/controller/signin/signin_cubit.dart';
import 'package:doctor_hunt/features/common/auth/presentation/controller/signup/signup_cubit.dart';
import 'package:doctor_hunt/features/common/auth/presentation/views/login_view.dart';
import 'package:doctor_hunt/features/common/auth/presentation/views/sign_up_view.dart';
import 'package:doctor_hunt/features/doctor/appointment/presentation/views/appointment_view.dart';
import 'package:doctor_hunt/features/doctor/appointment/presentation/views/time_selection_view.dart';
import 'package:doctor_hunt/features/doctor/favourite/presentation/views/favourite_view.dart';
import 'package:doctor_hunt/features/doctor/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/doctor/home/presentation/views/doctor_details.dart';
import 'package:doctor_hunt/features/doctor/home/presentation/views/home_view.dart';
import 'package:doctor_hunt/features/doctor/main_layout/presentation/views/main_layout.dart';
import 'package:doctor_hunt/features/common/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:doctor_hunt/features/common/auth/presentation/views/role_selection_view.dart';
import 'package:doctor_hunt/features/doctor/search/presentation/search_view.dart';
import 'package:doctor_hunt/features/common/spalsh/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RouteNames.splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: RouteNames.onBoardingRoute,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: RouteNames.roleSelectionRoute,
        builder: (context, state) => const RoleSelectionView(),
      ),
      GoRoute(
        path: RouteNames.signInRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => SigninCubit(authRepo: getIt<AuthRepoImp>()),
          child: SignInView(role: state.extra as String),
        ),
      ),
      GoRoute(
        path: RouteNames.signUpRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => SignupCubit(authRepo: getIt<AuthRepoImp>()),
          child: SignUpView(role: state.extra as String),
        ),
      ),
      GoRoute(
        path: RouteNames.mainLayoutRoute,
        builder: (context, state) => MainLayout(user: state.extra as UserModel),
      ),
      GoRoute(
        path: RouteNames.adminLayoutRoute,
        builder: (context, state) =>
            AdminLayout(user: state.extra as UserModel),
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

        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: RouteNames.timeSelectionRoute,

        builder: (context, state) =>
            TimeSelectionView(doctor: state.extra as DoctorModel),
      ),
      GoRoute(
        path: RouteNames.appointmentRoute,

        builder: (context, state) => const AppointmentView(),
      ),
      GoRoute(
        path: RouteNames.favouriteRoute,

        builder: (context, state) => const FavouriteView(),
      ),
      GoRoute(
        path: RouteNames.createDoctorRoute,

        builder: (context, state) => const CreateDoctorView(),
      ),
    ],
  );
}
