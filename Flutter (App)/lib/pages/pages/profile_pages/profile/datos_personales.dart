import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desk_login/pages/pages/profile_pages/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DatosPersonales extends StatefulWidget {
  const DatosPersonales({super.key});

  @override
  State<DatosPersonales> createState() => _DatosPersonalesState();
}

class _DatosPersonalesState extends State<DatosPersonales> {
  String? name = '';
  String? email = '';
  String? image = '';
  String? password = '';

  bool _obscurePassword = true;

  Future<void> _getDataFromDatabase() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["name"];
          email = snapshot.data()!["email"];
          image = snapshot.data()!["image"];
          password = snapshot.data()!["password"];
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
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Color(0xff222222),
      ),
      backgroundColor: Color(0xff222222),
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          //texto de datos personales
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 25 * screenHeight / 640, // Responsive top padding
                  left: 20 * screenWidth / 360, // Responsive left padding
                ),
                child: Text(
                  "Datos Personales",
                  style: TextStyle(
                    fontSize: 27 * screenWidth / 360, // Responsive font size
                    fontFamily: 'JoseFinSans-SemiBold',
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 40 * screenHeight / 640), // Responsive height

//nombre texto
              Padding(
                padding: EdgeInsets.only(
                  left: 20 * screenWidth / 360, // Responsive left padding
                ),
                child: Row(
                  children: [
                    Text(
                      "Nombre ",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JoseFinSans-SemiBold',
                        fontSize:
                            13 * screenWidth / 360, // Responsive font size
                      ),
                    ),
                    SizedBox(
                        width: 200 * screenWidth / 360), // Responsive width

//nombre usuario
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                      ),
                      child: Text(
                        name ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'JoseFinSans-Bold',
                          fontSize:
                              14 * screenWidth / 360, // Responsive font size
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//barra division
              Padding(
                padding: EdgeInsets.only(
                  top: 5 * screenHeight / 640, // Responsive top padding
                  right: 20 * screenWidth / 360, // Responsive right padding
                  left: 20 * screenWidth / 360, // Responsive left padding
                ),
                child: Divider(
                  color: Color(0xFF383838),
                  thickness: 1,
                ),
              ),

              SizedBox(height: 20 * screenHeight / 640), // Responsive height

//texto email
              Padding(
                padding: EdgeInsets.only(
                  left: 20 * screenWidth / 360, // Responsive left padding
                ),
                child: Row(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JoseFinSans-SemiBold',
                        fontSize:
                            13 * screenWidth / 360, // Responsive font size
                      ),
                    ),
                    SizedBox(
                        width: 140 * screenWidth / 360), // Responsive width

//tnombre gmail
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                      ),
                      child: Text(
                        currentUser.email!,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'JoseFinSans-Bold',
                          fontSize:
                              14 * screenWidth / 360, // Responsive font size
                        ),
                      ),
                    ),
                  ],
                ),
              ),

//divider
              Padding(
                padding: EdgeInsets.only(
                  top: 5 * screenHeight / 640, // Responsive top padding
                  right: 20 * screenWidth / 360, // Responsive right padding
                  left: 20 * screenWidth / 360, // Responsive left padding
                ),
                child: Divider(
                  color: Color(0xFF383838),
                  thickness: 1,
                ),
              ),

              SizedBox(height: 10 * screenHeight / 640), // Responsive height

//texto contraseña
              Padding(
                padding: EdgeInsets.only(
                  left: 20 * screenWidth / 360, // Responsive left padding
                ),
                child: Row(
                  children: [
                    Text(
                      "Contraseña",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JoseFinSans-SemiBold',
                        fontSize:
                            14 * screenWidth / 360, // Responsive font size
                      ),
                    ),

                    SizedBox(
                        width: 130 * screenWidth / 360), // Responsive width

//CONTRASEÑA usuario
                    Expanded(
                      child: TextFormField(
                        initialValue: password,
                        readOnly: true,
                        obscureText: _obscurePassword,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'JoseFinSans-Bold',
                          fontSize:
                              16 * screenWidth / 360, // Responsive font size
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            child: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical:
                                9 * screenHeight / 640, // Responsive padding
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: 0 * screenHeight / 640, // Responsive top padding
                  right: 20 * screenWidth / 360, // Responsive right padding
                  left: 20 * screenWidth / 360, // Responsive left padding
                ),
                child: const Divider(
                  color: Color(0xFF383838),
                  thickness: 1,
                ),
              ),

              SizedBox(height: 20 * screenHeight / 640), // Responsive height
            ],
          ),
        ),
      ),
    );
  }
}
