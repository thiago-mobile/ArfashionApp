import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desk_login/pages/pages/profile_pages/camera/camera.dart';
import 'package:desk_login/pages/pages/profile_pages/clothes/clothes.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/datos_personales.dart';
import 'package:desk_login/SignIn/login.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/invite_friend.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/purchase_history.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/seguridad.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../menu/menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
//variables para guardar datos del usuario
  String? name = '';
  String? email = '';
  String? image = '';
  String? imagePath;

//metodo para poder recuperar los datos

  Future<void> _getDataFromDatabase() async {
    try {
      // Obtener el nombre de usuario desde Firestore
      final snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["name"];
          email = snapshot.data()!["email"];
          image = snapshot.data()!["image"];
        });
      }
    } catch (e) {
      print("Error al obtener datos de firestore: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _getDataFromDatabase();
  }

  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isDarkMode = false;
  bool isPressed = false;
  List<Widget> screens = [
    const ClothesPage(),
    CameraScreen(),
    const ProfilePage(),
  ];

//metodo para poder abrir la galeria
  void _openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  bool _iconbool = false;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 600;

    return Scaffold(
//color de fondo del appbar
      backgroundColor: isDarkMode ? Colors.grey[100] : const Color(0xff222222),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            isDarkMode ? Colors.grey[100] : const Color(0xff222222),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDarkMode ? const Color(0xff222222) : Colors.grey[100],
          ),
        ),
        title: Text(
          'PERFIL',
          style: TextStyle(
            color: isDarkMode ? const Color(0xff222222) : Colors.grey[100],
            fontFamily: 'JoseFinSans-SemiBold',
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.sunny : Icons.nights_stay,
              color: isDarkMode ? Colors.black : Colors.white,
            ),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[100] : const Color(0xff222222),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.016,
              ),

//FOTO PERFIL
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.height * 0.15,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: imagePath != null
                          ? Image.file(
                              File(imagePath!),
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/alancito.jpg',
                              fit: BoxFit.cover,
                            ),
                    ),

                    //BOTON EDITAR
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          _openGallery();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.032,
                            width: MediaQuery.of(context).size.height * 0.04,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isDarkMode ? Colors.black : Colors.white,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: isDarkMode ? Colors.white : Colors.black,
                              size: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),

//texto nombre usuario
              Text(
                name ?? '',
                style: TextStyle(
                  color: isDarkMode ? Colors.black : Colors.white,
                  fontFamily: 'JoseFinSans-Regular',
                  fontSize: MediaQuery.of(context).size.height * 0.04,
                ),
              ),

              //texto email
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  currentUser.email!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'JoseFinSans-Medium',
                    fontSize: MediaQuery.of(context).size.height * 0.017,
                  ),
                ),
              ),

//boton de datos personales
              FractionallySizedBox(
                widthFactor: isSmallScreen ? 0.9 : 0.6,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DatosPersonales(),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.055,
                        decoration: BoxDecoration(
                          color: const Color(0xFF383838),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 17),
                              child: Image.asset(
                                'assets/Iconos/Configuracion/perfil.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              "Datos Personales",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontFamily: 'JoseFinSans-Regular',
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 12,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size:
                                    MediaQuery.of(context).size.height * 0.027,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

//boton configuracion y seguridad
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Security(),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.055,
                        decoration: BoxDecoration(
                          color: const Color(0xFF383838),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Image.asset(
                                'assets/Iconos/Configuracion/verificado.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                width:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * 0.023),
                            Text(
                              "Configuracion y seguridad",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontFamily: 'JoseFinSans-Regular',
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size:
                                    MediaQuery.of(context).size.height * 0.027,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

////boton historial de compra
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PurchaseHistory(),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.055,
                        decoration: BoxDecoration(
                          color: const Color(0xFF383838),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 17),
                              child: Image.asset(
                                'assets/Iconos/Configuracion/ala.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * 0.015),
                            Text(
                              "Historial De Compra",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontFamily: 'JoseFinSans-Regular',
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size:
                                    MediaQuery.of(context).size.height * 0.027,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

//boton de invitar un amigo
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InviteFriend()));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.055,
                        decoration: BoxDecoration(
                          color: const Color(0xFF383838),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Image.asset(
                                'assets/Iconos/Configuracion/agregar-usuario.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width:
                                    MediaQuery.of(context).size.height * 0.032,
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * 0.018),
                            Text(
                              "Invitar a un amigo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontFamily: 'JoseFinSans-Regular',
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size:
                                    MediaQuery.of(context).size.height * 0.027,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

//boton cerrar sesion
                    GestureDetector(
                      onTap: () async {
                        FirebaseAuth _auth = FirebaseAuth.instance;
                        await _auth.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.055,
                        decoration: BoxDecoration(
                          color: const Color(0xFF383838),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Image.asset(
                                'assets/Iconos/Configuracion/cerrar-sesion.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.027,
                                width:
                                    MediaQuery.of(context).size.height * 0.036,
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * 0.02),
                            Text(
                              "Cerrar Sesion",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                fontFamily: 'JoseFinSans-Regular',
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size:
                                    MediaQuery.of(context).size.height * 0.027,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// body: Container(
//   height: double.infinity,
//   width: double.infinity,
//   color: isDarkMode ? Colors.grey[900] : Colors.grey[100],
//   //Circulo FOTO DE PERFIL
//   child: Column(
//     children: [
//       Padding(
//         padding: const EdgeInsets.only(
//           top: 5,
//         ),
//         child: SizedBox(
//           height: 120,
//           width: 120,
//           child: Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(100),
//                 child: imagePath != null
//                     ? Image.file(
//                         File(imagePath!),
//                         fit: BoxFit.cover,
//                       )
//                     : Image.asset(
//                         'assets/alancito.jpg',
//                         fit: BoxFit.cover,
//                       ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: GestureDetector(
//                   onTap: () async {
//                     final newImagePath = await Navigator.push<String>(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const ProfileEdit(),
//                       ),
//                     );

//                     if (newImagePath != null) {
//                       setState(() {
//                         imagePath = newImagePath;
//                       });
//                     }
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       right: 5,
//                     ),
//                     child: Container(
//                       height: 30,
//                       width: 30,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: isDarkMode ? Colors.white : Colors.black,
//                       ),
//                       child: Icon(
//                         Icons.edit,
//                         color: isDarkMode ? Colors.black : Colors.white,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               top: 15,
//             ),
//             child: Text(
//               currentUser.email!,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: isDarkMode ? Colors.white : Colors.black,
//                 fontFamily: 'JoseFinSans-Medium',
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ],
//       ),
//       //BOTON Editar perfil
//       GestureDetector(
//         onTapDown: (_) {
//           setState(() {
//             isPressed = true;
//           });
//         },
//         onTapUp: (_) {
//           setState(() {
//             isPressed = false;
//           });
//         },
//         onTapCancel: () {
//           setState(() {
//             isPressed = false;
//           });
//         },
//         onTap: () async {
//           Navigator.push(
//             context,
//             PageRouteBuilder(
//               transitionDuration: const Duration(
//                   milliseconds: 500), // Duración de la animación
//               pageBuilder: (context, animation, secondaryAnimation) =>
//                   const ProfileEdit(), // Página de destino
//               transitionsBuilder:
//                   (context, animation, secondaryAnimation, child) {
//                 // Personaliza la animación aquí
//                 var begin = const Offset(2.0,
//                     0.0); // Posición inicial de la página de destino
//                 var end = Offset
//                     .zero; // Posición final de la página de destino
//                 var curve = Curves
//                     .easeInOutCirc; // Curva de animación (puede usar otras como Curves.easeInOut)

//                 var tween = Tween(begin: begin, end: end)
//                     .chain(CurveTween(curve: curve));

//                 return SlideTransition(
//                   position: animation.drive(tween),
//                   child: child,
//                 );
//               },
//             ),
//           );
//         },
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                 right: 15,
//                 left: 20,
//                 top: 20,
//                 bottom: 0,
//               ),
//               child: Container(
//                 height: 60,
//                 width: 220,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: <Color>[
//                       Color(0xFFDD50DB),
//                       Color(0xFF730A7C),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.circular(35),
//                   boxShadow: isPressed
//                       ? [
//                           BoxShadow(
//                             color: Colors.purple.withOpacity(0.7),
//                             spreadRadius: 2,
//                             blurRadius: 10,
//                             offset: const Offset(0, 3),
//                           ),
//                         ]
//                       : null,
//                 ),
//                 child: const Center(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 0),
//                     child: Text(
//                       'Editar Perfil',
//                       style: TextStyle(
//                         fontFamily: 'JosefinSans-SemiBold',
//                         fontSize: 20,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       Expanded(
//         child: Container(
//           width: double.infinity,
//           margin: const EdgeInsets.only(top: 20),
//           decoration: BoxDecoration(
//             color: isDarkMode ? Colors.black : Colors.white,
//             borderRadius:
//                 const BorderRadius.vertical(top: Radius.circular(54)),
//             boxShadow: [
//               BoxShadow(
//                 color: isDarkMode
//                     ? Colors.white.withOpacity(0.5)
//                     : Colors.black.withOpacity(0.5),
//                 spreadRadius: 3,
//                 blurRadius: 10,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 30,
//                   top: 25,
//                 ),
//                 child: Text(
//                   'Configuracion',
//                   style: TextStyle(
//                     fontFamily: 'JoseFinSans-Bold',
//                     fontSize: 25,
//                     color: isDarkMode ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ),
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       right: 0,
//                       left: 20,
//                       top: 10,
//                       bottom: 0,
//                     ),
//                     child: Container(
//                       height: 60,
//                       width: 370,
//                       decoration: BoxDecoration(
//                         color: isDarkMode ? Colors.black : Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 40,
//                             width: 40,
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.black,
//                             ),
//                             child: const Icon(
//                               LineAwesomeIcons.moon,
//                               color: Colors.white,
//                               size: 27,
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 10,
//                               ),
//                               child: Text(
//                                 'Dark Mode',
//                                 style: TextStyle(
//                                   fontFamily: 'JosefinSans-SemiBold',
//                                   fontSize: 19,
//                                   color: isDarkMode
//                                       ? Colors.white
//                                       : Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           IconButton(
//                             icon: Icon(
//                               isDarkMode
//                                   ? Icons.visibility_off
//                                   : Icons.visibility,
//                               color: isDarkMode
//                                   ? Colors.white
//                                   : Colors.black,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 isDarkMode = !isDarkMode;
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               GestureDetector(
//                 // onTap: () {
//                 //   Navigator.pushNamed(
//                 //     context, '/'
//                 //   );
//                 // },
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         right: 0,
//                         left: 20,
//                         top: 5,
//                         bottom: 0,
//                       ),
//                       child: Container(
//                         height: 60,
//                         width: 370,
//                         decoration: BoxDecoration(
//                           color:
//                               isDarkMode ? Colors.black : Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 40,
//                               width: 40,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: isDarkMode
//                                     ? Colors.black
//                                     : Colors.white,
//                               ),
//                               child: Icon(
//                                 Icons.notification_important,
//                                 color: isDarkMode
//                                     ? Colors.white
//                                     : Colors.black,
//                                 size: 27,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                   left: 10,
//                                 ),
//                                 child: Text(
//                                   'Notificaciones',
//                                   style: TextStyle(
//                                     fontFamily: 'JosefinSans-SemiBold',
//                                     fontSize: 19,
//                                     color: isDarkMode
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color: isDarkMode
//                                     ? Colors.black
//                                     : Colors.grey,
//                               ),
//                               onPressed: () {
//                                 // Aquí puedes realizar alguna acción adicional cuando se presione el botón
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const Account()),
//                   );
//                 },
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         right: 0,
//                         left: 20,
//                         top: 5,
//                         bottom: 0,
//                       ),
//                       child: Container(
//                         height: 60,
//                         width: 370,
//                         decoration: BoxDecoration(
//                           color:
//                               isDarkMode ? Colors.black : Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 40,
//                               width: 40,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: isDarkMode
//                                     ? Colors.black
//                                     : Colors.white,
//                               ),
//                               child: Icon(
//                                 Icons.security,
//                                 color: isDarkMode
//                                     ? Colors.white
//                                     : Colors.black,
//                                 size: 27,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                   left: 10,
//                                 ),
//                                 child: Text(
//                                   'Privacidad y Seguridad',
//                                   style: TextStyle(
//                                     fontFamily: 'JosefinSans-SemiBold',
//                                     fontSize: 19,
//                                     color: isDarkMode
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color: isDarkMode
//                                     ? Colors.black
//                                     : Colors.grey,
//                               ),
//                               onPressed: () {
//                                 // Aquí puedes realizar alguna acción adicional cuando se presione el botón
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const Account()));
//                 },
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         right: 0,
//                         left: 20,
//                         top: 5,
//                         bottom: 0,
//                       ),
//                       child: Container(
//                         height: 60,
//                         width: 370,
//                         decoration: BoxDecoration(
//                           color:
//                               isDarkMode ? Colors.black : Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 40,
//                               width: 40,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: isDarkMode
//                                     ? Colors.black
//                                     : Colors.white,
//                               ),
//                               child: Icon(
//                                 Icons.person_3_sharp,
//                                 color: isDarkMode
//                                     ? Colors.white
//                                     : Colors.black,
//                                 size: 27,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                   left: 10,
//                                 ),
//                                 child: Text(
//                                   'Mi Cuenta',
//                                   style: TextStyle(
//                                     fontFamily: 'JosefinSans-SemiBold',
//                                     fontSize: 19,
//                                     color: isDarkMode
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color: isDarkMode
//                                     ? Colors.black
//                                     : Colors.grey,
//                               ),
//                               onPressed: () {
//                                 // Aquí puedes realizar alguna acción adicional cuando se presione el botón
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const LoginPage()));
//                 },
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         right: 0,
//                         left: 20,
//                         top: 5,
//                         bottom: 0,
//                       ),
//                       child: Container(
//                         height: 60,
//                         width: 370,
//                         decoration: BoxDecoration(
//                           color:
//                               isDarkMode ? Colors.black : Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 40,
//                               width: 40,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.red,
//                               ),
//                               child: const Icon(
//                                 Icons.logout,
//                                 color: Colors.white,
//                                 size: 27,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                   left: 10,
//                                 ),
//                                 child: Text(
//                                   'Cerrar Sesion',
//                                   style: TextStyle(
//                                     fontFamily: 'JosefinSans-SemiBold',
//                                     fontSize: 19,
//                                     color: isDarkMode
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )
//     ],
//   ),
//   // Resto del código de tu perfil
// ),
