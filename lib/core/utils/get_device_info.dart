import 'package:flutter_udid/flutter_udid.dart';
import 'package:flutter/material.dart';

Future<String> getDeviceId() async {
  return await FlutterUdid.consistentUdid;
}

showSnackbar(BuildContext context, String text, bool success) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
}
