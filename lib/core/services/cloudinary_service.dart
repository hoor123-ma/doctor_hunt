import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:image_picker/image_picker.dart';

class CloudinaryService {
  final Cloudinary cloudinary;
  final ImagePicker imagePicker;

  const CloudinaryService({
    required this.cloudinary,
    required this.imagePicker,
  });

  Future<String?> uploadPhoto() async {
    try {
      final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile == null) return null;

      final File file = File(pickedFile.path);

      print('FILE PATH: ${file.path}');

      final response = await cloudinary.unsignedUpload(
        file: file.path,
        fileBytes: await file.readAsBytes(),
        uploadPreset: 'doctor_hunt_images',
        resourceType: CloudinaryResourceType.image,
      );

      print('STATUS CODE: ${response.statusCode}');
      print('ERROR: ${response.error}');
      print('URL: ${response.secureUrl}');

      if (response.isSuccessful) {
        return response.secureUrl;
      }

      return null;
    } catch (e, stackTrace) {
      print('UPLOAD ERROR: $e');
      print(stackTrace);
      return null;
    }
  }
}
