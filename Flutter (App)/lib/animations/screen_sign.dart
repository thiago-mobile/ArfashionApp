// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:page_transition/page_transition.dart';

// import '../pages/pages/menu/menu.dart';

// class ScreenSign extends StatelessWidget {
//   const ScreenSign({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Stack(
//         fit: StackFit.expand,
//         children: [
//           Container(
//             color: Colors.black,
//           ),
//           Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Lottie.asset('assets/Animaciones/Login/load.json',width: 100),
//               ],
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: Colors.black,
//       nextScreen: const MyMenu(),
//       splashIconSize: 500,
//       duration: 1000,
//       splashTransition: SplashTransition.fadeTransition,
//       pageTransitionType: PageTransitionType.fade,
//       animationDuration: const Duration(milliseconds: 1000),
//     );
//   }
// }