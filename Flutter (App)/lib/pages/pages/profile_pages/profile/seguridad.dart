import 'package:desk_login/pages/pages/profile_pages/profile/agregar_metodo.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/profile.dart';
import 'package:flutter/material.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: const Color(0xff222222),
        elevation: 0,
      ),
      backgroundColor: const Color(0xff222222),
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 25 * screenHeight / 640, // Responsive top padding
                  left: 20 * screenWidth / 360, // Responsive left padding
                ),
                child: Text(
                  "Configuracion",
                  style: TextStyle(
                    fontSize: 27 * screenWidth / 360, // Responsive font size
                    fontFamily: 'JoseFinSans-SemiBold',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30 * screenHeight / 640), // Responsive height

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Security()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:
                        5 * screenHeight / 640, // Responsive vertical padding
                  ),

//container lenguaje
                  child: Container(
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      color: Color(0xff222222),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 9 *
                                  screenWidth /
                                  360, // Responsive left padding
                            ),
                            child: Image.asset(
                              'assets/Iconos/Configuracion/idioma.png',
                              height: 30 *
                                  screenWidth /
                                  360, // Responsive image height
                              width: 30 *
                                  screenWidth /
                                  360, // Responsive image width
                            ),
                          ),
                          SizedBox(
                              width:
                                  10 * screenWidth / 360), // Responsive width
                          Text(
                            "Lenguaje",
                            style: TextStyle(
                              fontSize: 15 *
                                  screenWidth /
                                  360, // Responsive font size
                              fontFamily: 'JoseFinSans-SemiBold',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //Divider
              const Divider(
                color: Color(0xFF383838),
                thickness: 1,
              ),
//boton notificaciones
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Security()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:
                        10 * screenHeight / 640, // Responsive vertical padding
                  ),
                  child: Container(
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      color: Color(0xff222222),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 9 *
                                  screenWidth /
                                  360, // Responsive left padding
                            ),
                            child: Image.asset(
                              'assets/Iconos/Configuracion/notificacion.png',
                              height: 30 *
                                  screenWidth /
                                  360, // Responsive image height
                              width: 27 *
                                  screenWidth /
                                  360, // Responsive image width
                            ),
                          ),
                          SizedBox(
                              width:
                                  15 * screenWidth / 360), // Responsive width
                          Text(
                            "Notificaciones",
                            style: TextStyle(
                              fontSize: 15 *
                                  screenWidth /
                                  360, // Responsive font size
                              fontFamily: 'JoseFinSans-SemiBold',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const Divider(
                color: Color(0xFF383838),
                thickness: 1,
              ),

//texto privacidad
              Padding(
                padding: EdgeInsets.only(
                  top: 25 * screenHeight / 640, // Responsive top padding
                  left: 20 * screenWidth / 360, // Responsive left padding
                ),
                child: Text(
                  "Privacidad",
                  style: TextStyle(
                    fontSize: 27 * screenWidth / 360, // Responsive font size
                    fontFamily: 'JoseFinSans-SemiBold',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

//boton de cambiar contraseña
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Security()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:
                        5 * screenHeight / 640, // Responsive vertical padding
                  ),
                  child: Container(
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      color: Color(0xff222222),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 5 *
                                  screenWidth /
                                  360, // Responsive left padding
                            ),
                            child: Image.asset(
                              'assets/Iconos/Configuracion/change-password-gris.png',
                              height: 30 *
                                  screenWidth /
                                  360, // Responsive image height
                              width: 30 *
                                  screenWidth /
                                  360, // Responsive image width
                            ),
                          ),
                          SizedBox(
                              width:
                                  10 * screenWidth / 360), // Responsive width
                          Text(
                            "Cambiar contraseña",
                            style: TextStyle(
                              fontSize: 15 *
                                  screenWidth /
                                  360, // Responsive font size
                              fontFamily: 'JoseFinSans-SemiBold',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Color(0xFF383838),
                thickness: 1,
              ),

//boton de agregar metodo de pago
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardScreen()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:
                        10 * screenHeight / 640, // Responsive vertical padding
                  ),
                  child: Container(
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      color: Color(0xff222222),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 9 *
                                  screenWidth /
                                  360, // Responsive left padding
                            ),
                            child: Image.asset(
                              'assets/Iconos/Configuracion/tarjeta-credito.png',
                              height: 30 *
                                  screenWidth /
                                  360, // Responsive image height
                              width: 27 *
                                  screenWidth /
                                  360, // Responsive image width
                            ),
                          ),
                          SizedBox(
                              width:
                                  15 * screenWidth / 360), // Responsive width
                          Text(
                            "Agregar metodo de pago",
                            style: TextStyle(
                              fontSize: 15 *
                                  screenWidth /
                                  360, // Responsive font size
                              fontFamily: 'JoseFinSans-SemiBold',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
