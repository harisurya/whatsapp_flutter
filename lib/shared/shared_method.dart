part of 'shared.dart';

Future<File> getImage() async {
  ImagePicker _picker = ImagePicker();
  PickedFile image = await _picker.getImage(source: ImageSource.gallery);
  return File(image.path);
}

Future<String> uploadImage(File image) async {
  try {
    await FirebaseStorage.instance.ref('uploads/' + image.path).putFile(image);

    return await FirebaseStorage.instance
        .ref()
        .child('uploads/' + image.path)
        .getDownloadURL();
  } on FirebaseException catch (e) {
    return null;
  }
}
