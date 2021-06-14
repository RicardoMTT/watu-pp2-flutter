import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:probardispositivofisico/app_widgets/common_avatar.dart';
import 'package:probardispositivofisico/app_widgets/image_picker_wrapper.dart';

import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/profile/screens/form.dart';
import 'package:probardispositivofisico/profile/screens/form_bloc.dart';
import 'package:probardispositivofisico/profile/screens/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("XD ${ProfileController.to.itemSelected.toString()}");
    ProfileController _profileController = Get.find<ProfileController>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profile'),
          elevation: 0,
        ),
        body: ListView(
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(45),
                      ),
                    ),
                    child: Container(),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 60,
                    child: Container(
                      height: 120,
                      width: 230,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Text('Ricardo Tovar'),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Age: 25'),
                                Text('S/. 1500'),
                                Text('Score'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    bottom: 0,
                    child: BlocProvider(
                      create: (_) => ProfileFormBloc(),
                      child: Builder(
                        builder: (context) {
                          File _file;

                          return ImagePickerWrapper(
                            builder: (context, trigger) => InkWell(
                              onTap: () async {
                                _file = await trigger();
                                print("FIEL $_file");
                                _profileController.fileRx.value = _file;
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Cambiar foto',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 135,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 80,
                        width: 80,
                        child: Obx(() => ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Avatar(
                                newImageFile: _profileController.fileRx.value,
                              ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ProfileFormScreen()
          ],
        ),
      ),
    );
  }
}
