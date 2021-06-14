import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:probardispositivofisico/app_widgets/common_asset_image.dart';

class Avatar extends StatelessWidget {
  final File newImageFile;

  const Avatar({Key key, this.newImageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (newImageFile != null) {
      return Image.file(
        newImageFile,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      );
    } else {
      return const CommonAssetImage(
        asset: 'profile.png',
        height: 50,
      );
    }
  }
}
