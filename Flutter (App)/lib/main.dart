import 'package:desk_login/SignUp/SignUp.dart';
import 'package:desk_login/pages/pages/menu/menu.dart';
import 'package:desk_login/pages/pages/profile_pages/camera/camera.dart';
import 'package:desk_login/pages/pages/profile_pages/clothes/clothes.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/agregar_metodo.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/datos_personales.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/invite_friend.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/profile.dart';
import 'package:desk_login/SignIn/login.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/purchase_history.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/seguridad.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'animations/splash_screen.dart';

//inicializar el firebase para la app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

int currentTab = 0;
final List<String> screen = [
  '/ClothesPage',
  '/CameraScreen',
  '/ProfilePage',
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //configuracion para esperar el usuario a q se registre
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              final user = snapshot.data;
              {
                ThemeData(
                  fontFamily: 'JosefinSans',
                );
              }
              if (user != null) {
                return SplashScreen();
              } else {
                return const MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: '',
                  home: LoginPage(),
                );
              }
            }),
      ),
      initialRoute: '/',
      routes: {
        '/LoginPage': (context) => const LoginPage(),
        '/SplashScreen': (context) => SplashScreen(),
        '/SignUp': (context) => const SignUp(),
        '/CameraScreen': (context) => CameraScreen(),
        '/ProfilePage': (context) => const ProfilePage(),
        '/ClothesPage': (context) => ClothesPage(),
        '/MyMenu': (context) => MyMenu(),
        '/DatosPage': (context) => const DatosPersonales(),
        '/Security': (context) => const Security(),
        '/PurchaseHistory': (context) => PurchaseHistory(),
        '/InviteFriend': (context) => const InviteFriend(),
        '/MethodPay': (context) => CardScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}




// home: Scaffold(
//         body: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               Mostrar un indicador de carga mientras se verifica el estado de autenticación
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasData) {
//               Usuario autenticado, redirigir a la página principal
//               return const MyMenu();
//             } else {
//               No se ha iniciado sesión, redirigir a la página de inicio de sesión
//               return const LoginPage();
//             }
//           },
//         ),
//       ),



// home: Scaffold(
//         body: StreamBuilder<User?>(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               {
//                 ThemeData(
//                   fontFamily: 'JosefinSans',
//                 );
//               }
//               if (snapshot.hasData) {
//                 return const SplashScreen();
//               } else {
//                 return const MaterialApp(
//                   debugShowCheckedModeBanner: false,
//                   title: '',
//                   home: LoginPage(),
//                 );
//               }
//             }
//             ),
//       ),