import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class _CircleAvaterImagePickerState extends StatefulWidget {
  const _CircleAvaterImagePickerState({super.key});

  @override
  State<_CircleAvaterImagePickerState> createState() =>
      __CircleAvaterImagePickerStateState();
}

class __CircleAvaterImagePickerStateState
    extends State<_CircleAvaterImagePickerState> {
  File? image;
  final imagepicker = ImagePicker();

  upload() async {
    var pckiedimage = await imagepicker.pickImage(source: ImageSource.camera);
    if (pckiedimage != null) {
      setState(() {
        image = File(pckiedimage.path);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return image != null
        ? Stack(
            children: [
              CircleAvatar(
                maxRadius: 70,
                backgroundImage: FileImage(image!),
                onBackgroundImageError: (exception, stackTrace) => Text("data"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 110, left: 90),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    color: Color.fromARGB(255, 233, 55, 103),
                  ),
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        upload();
                      });
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        : Stack(
            children: [
              CircleAvatar(
                maxRadius: 70,
                backgroundImage: AssetImage("image/images.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 110, left: 90),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    color: Color.fromARGB(255, 233, 55, 103),
                  ),
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        upload();
                      });
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
