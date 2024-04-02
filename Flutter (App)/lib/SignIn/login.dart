import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desk_login/SignUp/SignUp.dart';
import 'package:desk_login/animations/screen_sign.dart';
import 'package:desk_login/pages/pages/menu/menu.dart';
import 'package:desk_login/pages/pages/profile_pages/clothes/clothes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import '../my_flutter_app_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //VARIABLES Y CONTROLADORES PARA GUARDAR DATOS
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  bool _isLoggingIn = false;
  bool isDone = true;
  bool isPressed = false;
  bool isHovered = false;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  bool isNameFocused = false;
  bool isArrowFocused = false;
  int selectedContainer = -1;
  // get signIn => null;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  final textFieldFocusNode = FocusNode();
  late bool _obscured = true;

//INICIAR SESION BOTON CON GOOGLE
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user?.displayName);

      if (userCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyMenu(),
          ),
        );
      }
    } catch (e) {
      print('Error de inicio de sesión con Google: $e');
    }
  }

//INICIAR SESION CON EMAIL Y CONTRASEÑA METODO

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Guarda los datos del usuario en Firestore
      String userId = userCredential.user!.uid;
      FirebaseFirestore.instance.collection('users').doc(userId).set({
        'email': email,
        'password': password,
        // Agrega aquí otros campos que quieras guardar
      });

      // Guarda la foto del usuario en Firebase Storage
      String imagePath = 'assets/alancito.jpg';
      Reference storageReference =
          FirebaseStorage.instance.ref().child('profile_images/$userId');
      UploadTask uploadTask = storageReference.putFile(File(imagePath));
      await uploadTask.whenComplete(() => null);

      print('Inicio de sesión exitoso');
    } catch (e) {
      print('Error de inicio de sesión: $e');
    }
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      }
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF000000),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                  ),
//LOGO FOTO
                  child: Image.asset(
                    'assets/Logo APP/logoficial.png',
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 1,
                    fit: BoxFit.contain,
                  ),
                ),

//TEXTO INICIAR SESION

                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25,
                    left: MediaQuery.of(context).size.width * 0.0,
                  ),
                  child: Text(
                    "Iniciar Sesión",
                    style: TextStyle(
                      fontFamily: "JosefinSans-Bold",
                      fontSize: MediaQuery.of(context).size.width * 0.1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            // Padding(
            //   padding: EdgeInsets.only(
            //     top: MediaQuery.of(context).size.height * 0.001,
            //     left: MediaQuery.of(context).size.width * 0.02,
            //     right: MediaQuery.of(context).size.width * 0.02,
            //   ),
            //   child: Container(
            //     child: const Text(
            //       'Inicia sesión con algunos de los siguientes pasos.',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 17,
            //         fontFamily: 'JoseFinSans-Light',
            //       ),
            //     ),
            //   ),
            // ),

            // Botones de Facebook
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.16,
                vertical: MediaQuery.of(context).size.height * 0.001,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Separar los botones
                children: [
                  GestureDetector(
                    onTapDown: (_) {
                      setState(() {
                        selectedContainer = 0;
                      });

                      Future.delayed(const Duration(milliseconds: 400), () {
                        setState(() {
                          selectedContainer = -1;
                        });
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: selectedContainer == 0
                              ? Colors.purple
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 27,
                        ),
                        onPressed: () {
                          // Agrega tu lógica para el botón aquí
                        },
                      ),
                    ),
                  ),

//BOTON GOOGLE
                  GestureDetector(
                    onTapDown: (_) {
                      setState(() {
                        selectedContainer = 1;
                      });

                      // Agrega tu lógica para el botón aquí

                      Future.delayed(const Duration(milliseconds: 400), () {
                        setState(() {
                          selectedContainer = -1;
                        });
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: selectedContainer == 1
                              ? Colors.purple
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          MyFlutterApp.google,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          signInWithGoogle();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Correo TEXTO
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.001,
                right: MediaQuery.of(context).size.width * 0.62,
                bottom: MediaQuery.of(context).size.height * 0.0013,
              ),
              child: Text(
                "Email",
                style: TextStyle(
                  fontFamily: "JosefinSans-Medium",
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),

// Correo electrónico CAJA TEXTO
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.009,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color:
                        isEmailFocused ? const Color(0xffC44BC1) : Colors.grey,
                    width: 2,
                  ),
                ),
                child: TextField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  onTap: () {
                    setState(() {
                      isEmailFocused = true;
                      isPasswordFocused = false;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.017,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Icon(
                        Icons.email_rounded,
                        color: isEmailFocused ? Colors.purple : Colors.grey,
                        size: 20,
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontFamily: 'JosefinSans-Thin',
                      fontSize: MediaQuery.of(context).size.width * 0.033,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

// Contraseña TEXTO
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                right: MediaQuery.of(context).size.width * 0.52,
                bottom: MediaQuery.of(context).size.height * 0.005,
              ),
              child: Text(
                "Contraseña",
                style: TextStyle(
                  fontFamily: "JosefinSans-Medium",
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),

// Contraseña CAJA TEXTO
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.002,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isPasswordFocused
                        ? const Color(0xffC44BC1)
                        : Color(0xFF9E9E9E),
                    width: 2,
                  ),
                ),
                child: TextField(
                  controller: passwordController,
                  enableInteractiveSelection: false,
                  obscureText: _obscured,
                  focusNode: textFieldFocusNode,
                  keyboardType: TextInputType.visiblePassword,
                  onTap: () {
                    setState(() {
                      isEmailFocused = false;
                      isPasswordFocused = true;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.024,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Icon(
                        Icons.lock,
                        color: isPasswordFocused ? Colors.purple : Colors.grey,
                        size: 20,
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontFamily: 'JosefinSans-Thin',
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.white,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.001,
                      ),
                      child: GestureDetector(
                        onTap: _toggleObscured,
                        child: Icon(
                          _obscured
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          size: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

// Botón Iniciar sesión
            GestureDetector(
              onTapDown: (_) {
                setState(() {
                  isPressed = true;
                });
              },
              onTapUp: (_) {
                setState(() {
                  isPressed = false;
                });
              },
              onTapCancel: () {
                setState(() {
                  isPressed = false;
                });
              },
              onTap: () async {
                try {
                  // Show CircularProgressIndicator
                  setState(() {
                    _isLoggingIn = true;
                  });

                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );

                  // Redirige al usuario a la pantalla de MyMenu
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyMenu()),
                  );
                } catch (e) {
                  // Manejar la excepción aquí, puedes mostrar un mensaje de error
                  // al usuario o realizar alguna otra acción.
                  print('Error de inicio de sesión: $e');
                } finally {
                  // Hide CircularProgressIndicator
                  setState(() {
                    _isLoggingIn = false;
                  });
                }
              },
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.07,
                  right: MediaQuery.of(context).size.width * 0.02,
                  left: MediaQuery.of(context).size.width * 0.02,
                  bottom: 0,
                ),
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xFFDD50DB),
                          Color(0xFF730A7C),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: isPressed
                          ? [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.7),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.003,
                        ),
                        child: _isLoggingIn
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                'Iniciar Sesion',
                                style: TextStyle(
                                  fontFamily: 'JosefinSans-SemiBold',
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.053,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

// No tienes cuenta TEXTO
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.025,
                  ),
                  child: Text(
                    "No tienes una cuenta?",
                    style: TextStyle(
                      fontFamily: "JosefinSans-Regular",
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),

//BOTON DE REGISTRARSE
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(
                            milliseconds: 500), // Duración de la animación
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const SignUp(), // Página de destino
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          // Personaliza la animación aquí
                          var begin = const Offset(1.0,
                              0.0); // Posición inicial de la página de destino
                          var end = Offset
                              .zero; // Posición final de la página de destino
                          var curve = Curves
                              .easeInOutExpo; // Curva de animación (puede usar otras como Curves.easeInOut)

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.005,
                      top: MediaQuery.of(context).size.height * 0.025,
                    ),
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'JoseFinSans-Bold',
                          fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
