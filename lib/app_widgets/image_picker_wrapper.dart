import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWrapper extends StatelessWidget {
  final Widget child;
  final Widget Function(BuildContext context, Future<File> Function() trigger)
      builder;

  const ImagePickerWrapper({Key key, this.child, this.builder})
      : super(key: key);

  Future<File> _getImage() async {
    final _pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    return File(_pickedFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return builder(context, _getImage);
  }
}
