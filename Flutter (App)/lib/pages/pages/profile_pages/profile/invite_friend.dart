import 'package:desk_login/pages/pages/profile_pages/profile/profile.dart';
import 'package:flutter/material.dart';

class InviteFriend extends StatefulWidget {
  const InviteFriend({super.key});

  @override
  State<InviteFriend> createState() => _InviteFriendState();
}

class _InviteFriendState extends State<InviteFriend> {
  bool isPressed = false;
  bool isButtonDisabled = false; // Habilitar el botón

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff222222),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color(0xff222222),
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 25 * screenHeight / 640,
                  left: 60 * screenWidth / 360,
                ),

//TEXTO INVITAR UN AMIGO
                child: Text(
                  "Invitar a un amigo",
                  style: TextStyle(
                    fontSize: 27 * screenWidth / 360,
                    fontFamily: 'JoseFinSans-Bold',
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  top: 13,
                ),

//TEXTO DESCRIPTIVO
                child: Text(
                  "Invita a tus amigos a conocer esta app, beneficios recibirás cada vez que logres invitar a uno",
                  style: TextStyle(
                    fontSize: 14 * screenWidth / 360,
                    fontFamily: 'JoseFinSans-Regular',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30 * screenHeight / 640),

// FOTO centrado
              Center(
                child: ClipOval(
                  child: Image.asset(
                    'assets/foto.jpg',
                    width: 300, // Tamaño de la imagen circular
                    height: 300, // Tamaño de la imagen circular
                    fit: BoxFit.cover, // Ajustar la imagen al círculo
                  ),
                ),
              ),

              SizedBox(
                height: 50,
              ),

//BOTON DE INVITAR UN AMIGO
              // Padding(
              //   padding: const EdgeInsets.all(30),
              //   child: ElevatedButton(
              //     onPressed: isButtonDisabled
              //         ? null
              //         : () async {
              //             setState(() {
              //               Share.share('com.example.desk_login');
              //             });
              //           },
              //     style: ElevatedButton.styleFrom(
              //       primary: Colors.purple, // Color de fondo del botón
              //       onPrimary: Colors.white, // Color del texto del botón
              //       elevation: isPressed
              //           ? 10
              //           : 0, // Sombra cuando se presiona el botón
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(
              //             30), // Bordes redondeados del botón
              //       ),
              //     ),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(vertical: 15),
              //       child: Text(
              //         'Invitar amigo',
              //         style: TextStyle(
              //           fontFamily: 'JosefinSans-SemiBold',
              //           fontSize: 20,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:desk_login/pages/pages/profile_pages/profile/profile.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileEdit extends StatefulWidget {
//   const ProfileEdit({super.key});

//   @override
//   State<ProfileEdit> createState() => _ProfileEditState();
// }

// class _ProfileEditState extends State<ProfileEdit> {
//   bool isEmailFocused = false;
//   bool isPasswordFocused = false;
//   bool isNameFocused = false;
//   late bool _obscured = false;
//   final textFieldFocusNode = FocusNode();
//   String? name;
//   String? email;
//   String? password;
//   final picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the name, email, and password variables with the preloaded values
//     name = name;
//     email = email;
//     password = password;
//   }

//   void _toggleObscured() {
//     setState(() {
//       _obscured = !_obscured;
//       if (textFieldFocusNode.hasPrimaryFocus) {
//         return; // If focus is on text field, don't unfocus
//       }
//       textFieldFocusNode.canRequestFocus =
//           false; // Prevents focus if tap on eye
//     });
//   }

//   String? imagePath;
//   void _openGallery() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         imagePath = pickedFile.path;
//       });
//     }
//   }

//   Future<void> updateUserProfile(String newName, String newEmail,
//       String newPassword, String imagePath) async {
//     try {
//       User? currentUser = FirebaseAuth.instance.currentUser;
//       String userId = currentUser!.uid;

//       // Actualiza los datos del usuario en Firestore
//       await FirebaseFirestore.instance.collection('users').doc(userId).update({
//         'name': newName,
//         'email': newEmail,
//         'password': newPassword,
//         // Agrega aquí otros campos que quieras actualizar
//       });

//       // Actualiza la foto del usuario en Firebase Storage
//       if (imagePath != null) {
//         File imageFile = File(imagePath);
//         Reference storageReference =
//             FirebaseStorage.instance.ref().child('profile_images/$userId');
//         UploadTask uploadTask = storageReference.putFile(imageFile);
//         await uploadTask.whenComplete(() => null);
//       }

//       print('Perfil actualizado con éxito');
//     } catch (e) {
//       print('Error al actualizar el perfil: $e');
//     }
//   }

//   int selectedContainer = -1;
//   bool isPressed = false;
//   bool isHovered = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: //isDarkMode ? Colors.grey[900] :
//             Colors.grey[100],
//         leading: IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 PageRouteBuilder(
//                   transitionDuration: const Duration(
//                       milliseconds: 500), // Duración de la animación
//                   pageBuilder: (context, animation, secondaryAnimation) =>
//                       const ProfilePage(), // Página de destino
//                   transitionsBuilder:
//                       (context, animation, secondaryAnimation, child) {
//                     // Personaliza la animación aquí
//                     var begin = const Offset(
//                         -1.0, 0.0); // Posición inicial de la página de destino
//                     var end =
//                         Offset.zero; // Posición final de la página de destino
//                     var curve = Curves
//                         .easeInOut; // Curva de animación (puede usar otras como Curves.easeInOut)

//                     var tween = Tween(begin: begin, end: end)
//                         .chain(CurveTween(curve: curve));

//                     return SlideTransition(
//                       position: animation.drive(tween),
//                       child: child,
//                     );
//                   },
//                 ),
//               );
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//             )),
//         title: const Text(
//           'Editar Perfil',
//           style: TextStyle(
//             color: //isDarkMode ? Colors.white :
//                 Colors.black,
//             fontFamily: 'JoseFinSans-SemiBold',
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         color: //isDarkMode ? Colors.grey[900] :
//             Colors.grey[100],
//         //Circulo FOTO DE PERFIL
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   top: 5,
//                 ),
//                 child: Stack(
//                   children: [
//                     SizedBox(
//                       height: 120,
//                       width: 120,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(100),
//                         child: imagePath != null
//                             ? Image.file(
//                                 File(imagePath!),
//                                 fit: BoxFit.cover,
//                               )
//                             : Image.asset(
//                                 'assets/alancito.jpg',
//                                 fit: BoxFit.cover,
//                               ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: GestureDetector(
//                         onTap: () {
//                           _openGallery();
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                             right: 5,
//                           ),
//                           child: Container(
//                             height: 30,
//                             width: 30,
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.black,
//                             ),
//                             child: const Icon(
//                               Icons.edit,
//                               color: Colors.white,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                       top: 50,
//                       right: 230,
//                       bottom: 6,
//                     ),
//                     child: Text(
//                       "Nombre",
//                       style: TextStyle(
//                         fontFamily: "JosefinSans-Medium",
//                         fontSize: 17,
//                         color: Colors.black,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               // nombre CAJA TEXTO
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       right: 20,
//                       left: 20,
//                       top: 0,
//                       bottom: 20,
//                     ),
//                     child: Container(
//                       width: 320,
//                       height: 60,
//                       decoration: BoxDecoration(
//                           color: const Color(0xFFC9C9C9),
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(
//                             color: isNameFocused ? Colors.black : Colors.grey,
//                             width: 2,
//                           )),
//                       child: TextField(
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'JosefinSans-Regular',
//                           fontSize: 17,
//                         ),
//                         onTap: () {
//                           setState(() {
//                             isNameFocused = true;
//                             isEmailFocused = false;
//                             isPasswordFocused = false;
//                           });
//                         },
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           contentPadding:
//                               const EdgeInsets.symmetric(vertical: 24),
//                           border: InputBorder.none,
//                           prefixIcon: Icon(
//                             Icons.person,
//                             color: isNameFocused ? Colors.black : Colors.grey,
//                           ),
//                           hintStyle: const TextStyle(
//                             fontFamily: 'JosefinSans-Thin',
//                             fontSize: 20,
//                             color: Colors.black,
//                           ),
//                         ),
//                         onChanged: (value) {
//                           setState(() {
//                             name = value;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                       top: 10,
//                       right: 249,
//                       bottom: 6,
//                     ),
//                     child: Text(
//                       "Correo",
//                       style: TextStyle(
//                         fontFamily: "JosefinSans-Medium",
//                         fontSize: 17,
//                         color: Colors.black,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               // correo CAJA TEXTO
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       right: 20,
//                       left: 20,
//                       top: 0,
//                       bottom: 20,
//                     ),
//                     child: Container(
//                       width: 320,
//                       height: 60,
//                       decoration: BoxDecoration(
//                           color: const Color(0xFFC9C9C9),
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(
//                             color: isEmailFocused ? Colors.black : Colors.grey,
//                             width: 2,
//                           )),
//                       child: TextField(
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'JosefinSans-Regular',
//                           fontSize: 17,
//                         ),
//                         onTap: () {
//                           setState(() {
//                             isNameFocused = false;
//                             isEmailFocused = true;
//                             isPasswordFocused = false;
//                           });
//                         },
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           contentPadding:
//                               const EdgeInsets.symmetric(vertical: 24),
//                           border: InputBorder.none,
//                           prefixIcon: Icon(
//                             Icons.email,
//                             color: isEmailFocused ? Colors.black : Colors.grey,
//                           ),
//                           hintStyle: const TextStyle(
//                             fontFamily: 'JosefinSans-Thin',
//                             fontSize: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                         onChanged: (value) {
//                           setState(() {
//                             email = value;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                       top: 7,
//                       right: 210,
//                       bottom: 6,
//                     ),
//                     child: Text(
//                       "Contraseña",
//                       style: TextStyle(
//                         fontFamily: "JosefinSans-Medium",
//                         fontSize: 17,
//                         color: Colors.black,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               //contraseña CAJA TEXTO
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       right: 20,
//                       left: 20,
//                       top: 0,
//                       bottom: 20,
//                     ),
//                     child: Container(
//                       width: 320,
//                       height: 60,
//                       decoration: BoxDecoration(
//                           color: const Color(0xFFC9C9C9),
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(
//                             color:
//                                 isPasswordFocused ? Colors.black : Colors.grey,
//                             width: 2,
//                           )),
//                       child: TextField(
//                         keyboardType: TextInputType.visiblePassword,
//                         enableInteractiveSelection: false,
//                         onTap: () {
//                           setState(() {
//                             isNameFocused = false;
//                             isEmailFocused = false;
//                             isPasswordFocused = true;
//                           });
//                         },
//                         decoration: InputDecoration(
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           contentPadding:
//                               const EdgeInsets.symmetric(vertical: 24),
//                           border: InputBorder.none,
//                           prefixIcon: Icon(
//                             Icons.password,
//                             color:
//                                 isPasswordFocused ? Colors.black : Colors.grey,
//                           ),
//                           hintStyle: const TextStyle(
//                             fontFamily: 'JosefinSans-Thin',
//                             fontSize: 15,
//                             color: Colors.black,
//                           ),
//                           suffixIcon: Padding(
//                             padding: const EdgeInsets.only(top: 10),
//                             child: GestureDetector(
//                               onTap: _toggleObscured,
//                               child: Icon(
//                                 _obscured
//                                     ? Icons.visibility_off_rounded
//                                     : Icons.visibility_rounded,
//                                 size: 24,
//                               ),
//                             ),
//                           ),
//                         ),
//                         onChanged: (value) {
//                           setState(() {
//                             password = value;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               GestureDetector(
//                 onTapDown: (_) {
//                   setState(() {
//                     isPressed = true;
//                   });
//                 },
//                 onTapUp: (_) {
//                   setState(() {
//                     isPressed = false;
//                   });
//                 },
//                 onTapCancel: () {
//                   setState(() {
//                     isPressed = false;
//                   });
//                 },
//                 onTap: () async {
//                   updateUserProfile(name!, email!, password!, imagePath!);
//                 },
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         right: 15,
//                         left: 20,
//                         top: 30,
//                         bottom: 0,
//                       ),
//                       child: Container(
//                         height: 55,
//                         width: 240,
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: <Color>[
//                               Color(0xFFDD50DB),
//                               Color(0xFF730A7C),
//                             ],
//                           ),
//                           borderRadius: BorderRadius.circular(35),
//                           boxShadow: isPressed
//                               ? [
//                                   BoxShadow(
//                                     color: Colors.purple.withOpacity(0.7),
//                                     spreadRadius: 2,
//                                     blurRadius: 10,
//                                     offset: const Offset(0, 3),
//                                   ),
//                                 ]
//                               : null,
//                         ),
//                         child: const Center(
//                           child: Padding(
//                             padding: EdgeInsets.only(top: 0),
//                             child: Text(
//                               'Guardar Datos',
//                               style: TextStyle(
//                                 fontFamily: 'JosefinSans-SemiBold',
//                                 fontSize: 20,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         //Restro del programa
//       ),
//     );
//   }
// }
