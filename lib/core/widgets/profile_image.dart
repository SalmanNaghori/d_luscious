// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shimmer/shimmer.dart';

class ProfileImage extends StatefulWidget {
  final String? profilePictureUrl;
  final Function selectedFile;
  const ProfileImage({
    Key? key,
    this.profilePictureUrl,
    required this.selectedFile,
  }) : super(key: key);

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  ValueNotifier<bool> isValuechanged = ValueNotifier<bool>(false);
  File? imageFile;

  showDialogMethod(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pick Image"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () async {
                  await Permission.camera.request();
                  var permissionStatus = await Permission.camera.status;
                  if (permissionStatus.isGranted) {
                    picImage(ImageSource.camera);
                    navigatePop();
                  } else {
                    navigatePop(); // Close the dialog
                  }
                },
                child: const ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Camera"),
                ),
              ),
              InkWell(
                onTap: () async {
                  await Permission.storage.request();

                  var permissionStatus = await Permission.storage.status;
                  if (permissionStatus.isGranted) {
                    picImage(ImageSource.gallery);
                    navigatePop();
                  } else {
                    navigatePop(); // Close the dialog
                  }
                },
                child: const ListTile(
                  leading: Icon(Icons.photo),
                  title: Text("Gallery"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isValuechanged,
      builder: (context, isImageAvailable, _) {
        if (imageFile != null) {
          return CircleAvatar(
            radius: 80,
            backgroundImage: FileImage(imageFile!), // Use Image.file
            child: InkWell(
              onTap: () {
                showDialogMethod(context);
              },
            ),
          );
        } else if (widget.profilePictureUrl != null) {
          return MyCircleProfle(
            radius: 80,
            image: widget.profilePictureUrl ?? "",
          );
        } else {
          return CircleAvatar(
            radius: 80,
            child: InkWell(
              onTap: () {
                showDialogMethod(context);
              },
              child: Shimmer.fromColors(
                baseColor: ConstColor.whiteColor,
                highlightColor: ConstColor.greyColor,
                child: const CircleAvatar(
                  radius: 80,
                ),
              ),
            ),
          );
        }

        // return imageFile != null
        //     ? CircleAvatar(
        //         radius: 80,
        //         backgroundImage: FileImage(imageFile!), // Use Image.file
        //         child: InkWell(
        //           onTap: () {
        //             showDialogMethod(context);
        //           },
        //         ),
        //       )
        //     : widget.profilePictureUrl != null
        //         ? MyCircleProfle(
        //             radius: 80,
        //             image: widget.profilePictureUrl ?? "",
        //           )
        //         : CircleAvatar(
        //             radius: 80,
        //             child: InkWell(
        //               onTap: () {
        //                 showDialogMethod(context);
        //               },
        //               child: Shimmer.fromColors(
        //                 baseColor: ConstColor.whiteColor,
        //                 highlightColor: ConstColor.greyColor,
        //                 child: CircleAvatar(
        //                   radius: 80,
        //                 ),
        //               ),
        //             ),
        //           );
      },
    );
  }

  picImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) {
        return;
      }
      final tempImage = File(photo.path);

      imageFile = tempImage;
      widget.selectedFile(tempImage);
      isValuechanged.value = !isValuechanged.value;
    } catch (ex) {
      log("Error: $ex");
    }
  }

  navigatePop() async {
    Navigator.pop(context);
  }
}
