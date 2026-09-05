import 'package:cloudinary/cloudinary.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doctor_hunt/core/services/auth_service.dart';
import 'package:doctor_hunt/core/services/cloudinary_service.dart';
import 'package:doctor_hunt/core/services/fire_store_service.dart';
import 'package:doctor_hunt/features/auth/data/repos/auth_repo_imp.dart';
import 'package:doctor_hunt/features/home/data/repos/user_repo_imp.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

GetIt getIt = GetIt.instance;
Future<void> setUpServiceLocator() async {
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
