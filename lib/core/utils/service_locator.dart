import 'package:doctor_hunt/core/services/auth_service.dart';
import 'package:doctor_hunt/features/auth/data/repos/auth_repo_imp.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
Future<void> setUpServiceLocator() async {
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<AuthRepoImp>(
    () => AuthRepoImp(authService: getIt<AuthService>()),
  );
}
