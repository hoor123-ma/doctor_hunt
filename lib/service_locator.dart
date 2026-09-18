import 'package:cloudinary/cloudinary.dart';
import 'package:doctor_hunt/core/services/cloudinary_service.dart';
import 'package:doctor_hunt/core/services/fire_store_service.dart';
import 'package:doctor_hunt/core/services/shared_prefrence_services.dart';
import 'package:doctor_hunt/features/admin/doctors/data/repos/doctors_repo._imp.dart';
import 'package:doctor_hunt/features/common/auth/data/repos/auth_repo_imp.dart';
import 'package:doctor_hunt/features/common/auth/data/services/auth_service.dart';
import 'package:doctor_hunt/features/doctor/home/data/repos/user_repo_imp.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

GetIt getIt = GetIt.instance;
Future<void> setUpServiceLocator() async {
  await SharedPreferencesService.init();

  getIt.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(),
  );
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService());
  getIt.registerLazySingleton<AuthRepoImp>(
    () => AuthRepoImp(
      authService: getIt<AuthService>(),
      firestoreService: getIt<FirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<UserRepoImp>(
    () => UserRepoImp(
      cloudinaryService: getIt<CloudinaryService>(),
      firestoreService: getIt<FirestoreService>(),
      authService: getIt<AuthService>(),
    ),
  );
  getIt.registerLazySingleton<DoctorsRepoImp>(
    () => DoctorsRepoImp(
      cloudinaryService: getIt<CloudinaryService>(),
      firestoreService: getIt<FirestoreService>(),
    ),
  );
  getIt.registerLazySingleton<ImagePicker>(() => ImagePicker());
  getIt.registerLazySingleton<Cloudinary>(
    () => Cloudinary.unsignedConfig(cloudName: 'w5iirmvo'),
  );

  getIt.registerLazySingleton<CloudinaryService>(
    () => CloudinaryService(
      cloudinary: getIt<Cloudinary>(),
      imagePicker: getIt<ImagePicker>(),
    ),
  );
}
