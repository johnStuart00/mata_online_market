import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mata_online_market/core/assets/app_images.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AssetsPath().errorLottiePath),
            const SizedBox(height: 15),
            const Text(
              'Serwere baglanyp bilmedi. \nInternetiňizi barlaň!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Täzeden synanş'),
            )
          ],
        ),
      ),
    );
  }
}
