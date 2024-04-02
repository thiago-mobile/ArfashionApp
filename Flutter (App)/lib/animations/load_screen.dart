import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:desk_login/pages/pages/profile_pages/clothes/clothes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/pages/menu/menu.dart';

class LoadScreen extends StatelessWidget {
  const LoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        constraints: const BoxConstraints(maxWidth: 180, maxHeight: 180),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('assets/Animaciones/Registro/Registro.json'),
              const SizedBox(height: 16),
              const Text(
                'Registro exitoso',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: 'JoseFinSans-SemiBold',
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      nextScreen: ClothesPage(),
      splashIconSize: 1000,
      duration: 1000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      animationDuration: const Duration(milliseconds: 1000),
      // Resto del código...
    );
  }
}
