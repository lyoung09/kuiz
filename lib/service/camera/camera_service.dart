import 'package:image_picker/image_picker.dart';

class CameraService {
  PickedFile? _image;
  Future<PickedFile> getImageFromCamera() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);

    _image = image!;
    return _image!;
  }

  Future<PickedFile> getImageFromGallery() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    _image = image!;
    return _image!;
  }
}
