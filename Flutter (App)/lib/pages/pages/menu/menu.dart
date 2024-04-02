import 'package:desk_login/pages/pages/menu/problemas.dart';
import 'package:desk_login/pages/pages/profile_pages/camera/camera.dart';
import 'package:desk_login/pages/pages/profile_pages/clothes/clothes.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class MyMenu extends StatefulWidget {
  @override
  MyMenuState createState() => MyMenuState();
}

class MyMenuState extends State<MyMenu> {
  var _pageIndex = 0;
  late List<Widget> screen = [
    ClothesPage(),
    CameraScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screen.elementAt(_pageIndex),

          //CONTAINER NEGRO BARRA DE NAVEGACION
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                width: 340,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(listOfIcons.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 3,
                            width: 30,
                            color: _pageIndex == index
                                ? Colors.purple
                                : Colors.transparent,
                          ),
                          SizedBox(height: 3),

                          //BARRA ARRIBA DE LOS ICONOS
                          Icon(
                            listOfIcons[index],
                            size: 28,
                            color: _pageIndex == index
                                ? Colors.purple
                                : Colors.white,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.shopping_bag,
    Icons.center_focus_weak,
    Icons.account_circle,
  ];
}

// void main() => runApp(const MaterialApp(
//       home: MyMenu(),
//     ));

// class MyMenu extends StatefulWidget {
//   const MyMenu({Key? key});

//   @override
//   State<MyMenu> createState() => _MyMenu();
// }

// class _MyMenu extends State<MyMenu> {
//   int _paginaActual = 0;
//   final List<String> _paginas = [
//     '/ClothesPage',
//     '/CameraScreen',
//     '/ProfilePage',
//   ];
//   bool _isKeyboardVisible = false;

//   final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

//   void cambiarPagina(int index) {
//     setState(() {
//       _paginaActual = index;
//     });

//     _navigatorKey.currentState?.push(
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) {
//           switch (index) {
//             case 0:
//               return ClothesPage();
//             case 1:
//               return CameraScreen();
//             case 2:
//               return const ProfilePage();
//             default:
//               return Problemas();
//           }
//         },
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           // Personaliza la animación aquí
//           var begin = const Offset(
//               -1.0, 0.0); // Posición inicial de la página de destino
//           var end = Offset.zero; // Posición final de la página de destino
//           var curve = Curves
//               .easeInOut; // Curva de animación (puede usar otras como Curves.easeInOut)

//           var tween =
//               Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//           return SlideTransition(
//             position: animation.drive(tween),
//             child: child,
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return KeyboardVisibilityBuilder(
//       builder: (context, isKeyboardVisible) {
//         _isKeyboardVisible = isKeyboardVisible;
//         return Scaffold(
//           backgroundColor: Color(0xff222222),
//           body: Navigator(
//             key: _navigatorKey,
//             initialRoute: _paginas[_paginaActual],
//             onGenerateRoute: (RouteSettings settings) {
//               WidgetBuilder builder;
//               switch (settings.name) {
//                 case '/ClothesPage':
//                   builder = (BuildContext context) => ClothesPage();
//                   break;
//                 case '/CameraScreen':
//                   builder = (BuildContext context) => CameraScreen();
//                   break;
//                 case '/ProfilePage':
//                   builder = (BuildContext context) => const ProfilePage();
//                   break;
//                 default:
//                   return MaterialPageRoute(
//                       builder: (BuildContext context) => Problemas());
//               }
//               return MaterialPageRoute(builder: builder, settings: settings);
//             },
//           ),
//           bottomNavigationBar: BottomAppBar(
//             shape: const CircularNotchedRectangle(),
//             color: Colors.black,
//             child: SizedBox(
//               height: 70,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                         right: 30,
//                       ),
//                       child: IconButton(
//                         onPressed: () {
//                           cambiarPagina(0);
//                         },
//                         icon: Icon(
//                           Icons.shopping_bag,
//                           color: _paginaActual == 0
//                               ? const Color(0xffC44BC1)
//                               : Colors.white,
//                           size: 31,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                         left: 30,
//                       ),
//                       child: IconButton(
//                         onPressed: () {
//                           cambiarPagina(2);
//                         },
//                         icon: Icon(
//                           Icons.person,
//                           color: _paginaActual == 2
//                               ? const Color(0xffC44BC1)
//                               : Colors.white,
//                           size: 31,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           floatingActionButtonLocation: _isKeyboardVisible
//               ? null
//               : FloatingActionButtonLocation.centerDocked,
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               cambiarPagina(1);
//             },
//             backgroundColor: Colors.black,
//             child: const Icon(
//               Icons.camera_alt,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
