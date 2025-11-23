import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../routes/routes.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      NavigationService().go(Routes.ageScreen);
    });

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/splashscreen.json', width: 200),
            SizedBox(height: 20),
            Text(
              'SmartyKids',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontFamily: 'ComicNeue',
              ),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(color: Colors.purple),
          ],
        ),
      ),
    );
  }
}
