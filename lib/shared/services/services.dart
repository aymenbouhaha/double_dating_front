import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Services{

  static Future<File?> getImage() async {
    File? image;

    final ImagePicker imagePicker = ImagePicker();
    print('${imagePicker.toString()}');

    final XFile? pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 40);

    if (pickedImage != null) {
      // Push to add bird screen
      image = File(pickedImage.path);
      return image;
    } else {
      print("No image selected");
      return null;
    }

  }


}