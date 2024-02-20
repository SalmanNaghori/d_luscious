import 'package:d_luscious/core/constant/app_image.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAsset.icNoInternet, // Replace with your own image asset
            ),
            const SizedBox(height: 16),
            const Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            const Text(
              'Please check your internet connection and try again.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: ConstColor.greyColor),
            ),
            const SizedBox(height: 24),
            // ElevatedButton(
            //   onPressed: () {
            //     // You can add logic to check for internet connectivity
            //     // and take appropriate actions, such as retrying to connect.
            //   },
            //   child: Text('Retry'),
            // ),
          ],
        ),
      ),
    );
  }
}
