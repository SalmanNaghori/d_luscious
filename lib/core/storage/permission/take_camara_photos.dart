import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestStoragePermission() async {
  bool permissionStatus;

  try {
    final deviceInfo = await DeviceInfoPlugin().androidInfo;

    if (deviceInfo.version.sdkInt > 32) {
      log(deviceInfo.version.sdkInt.toString());
      permissionStatus = await Permission.photos.request().isGranted;
    } else {
      log(deviceInfo.version.sdkInt.toString());
      permissionStatus = await Permission.storage.request().isGranted;
    }

    return permissionStatus;
  } catch (e) {
    // Handle exception if any
    log('Error requesting storage permission: $e');
    return false;
  }
}
