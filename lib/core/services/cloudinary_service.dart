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
    final XFile? pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile == null) return null;

    final File file = File(pickedFile.path);

    final response = await cloudinary.unsignedUpload(
      file: file.path,
      fileBytes: await file.readAsBytes(),
      uploadPreset: 'doctor_hunt_images',
      resourceType: CloudinaryResourceType.image,
    );

    return response.secureUrl;
  }
}
