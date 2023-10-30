import 'package:andipublisher/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DownloadLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              Assets.lottie.ebookdownload, // Replace with your Lottie animation file path
              width: 200, // Increase the size of the animation
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              'Mengunduh Ebook...',
              style: TextStyle(
                color: Colors.black, // Set the text color to black
                fontSize: 18, // Increase the font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}