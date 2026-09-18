import 'package:doctor_hunt/core/consts/app_consts.dart';
import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/services/shared_prefrence_services.dart';
import 'package:doctor_hunt/features/doctor/home/data/repos/user_repo_imp.dart';
import 'package:doctor_hunt/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> handleStartup(BuildContext context) async {
  final isOnboardingSeen = getIt<SharedPreferencesService>()
      .getIsOnboardingSeen();

  if (!(isOnboardingSeen ?? false)) {
    context.go(RouteNames.onBoardingRoute);
    return;
  }

  final result = await getIt<UserRepoImp>().getLoggedInUser(
    AppConsts.usersCollection,
  );

  result.fold(
    (error) {
      // حصل error أثناء جلب المستخدم
      context.go(RouteNames.roleSelectionRoute);
    },
    (user) {
      if (user == null) {
        // مفيش current user عامل login
        context.go(RouteNames.roleSelectionRoute);
        return;
      }

      // فيه user عامل login
      // هنا نستخدم الـ role
      if (user.role == AppConsts.adminRole) {
        context.go(RouteNames.adminLayoutRoute,extra: user);
      } else if (user.role == AppConsts.patientRole) {
        context.go(RouteNames.mainLayoutRoute,extra: user);
      }
    },
  );
}
