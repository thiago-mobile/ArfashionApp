import 'dart:ui';

import 'package:desk_login/pages/pages/profile_pages/clothes/product_cart.dart';
import 'package:flutter/material.dart';

class ClothesPage extends StatefulWidget {
  const ClothesPage({super.key});

  @override
  State<ClothesPage> createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {
  final List<String> catList = ["Todas", "Nike", "Puma", "Adidas"];
  List<String> imgList = [
    "Remera Aeropostale",
    "nike remera",
    "pantalon nike",
    "zapatillas nike",
  ];

  int guideStep = 0;
  bool isPressed = false;
  bool backdropFilterActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
//BUSCAR CONTAINER
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 221, 221, 221),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 3,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Buscar...",
                          hintStyle:
                              TextStyle(fontFamily: 'JoseFinSans-SemiBold'),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

//ICONO NOTIFICACION
                Padding(
                  padding: const EdgeInsets.only(
                    left: 0,
                  ),
                  child: Container(
                    width: 50,
                    height: 40,
                    padding: const EdgeInsets.only(
                      left: 0,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff222222),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),

//BAN DE NIKE
          Container(
            height: 190,
            margin: const EdgeInsets.only(right: 25, top: 100),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/RopaPage/Marcas/Nike/nike.jpg",
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),

//CONTAINER DE MARCAS
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 300, left: 10),
              child: Row(
                children: [
                  for (int i = 0; i < catList.length; i++)
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.symmetric(
                          vertical: 19, horizontal: 18),
                      decoration: BoxDecoration(
                        color: catList[i] == "Todas"
                            ? Colors.purple
                            : const Color(0XFFF7F8FA),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        catList[i],
                        style: TextStyle(
                          fontSize: 16,
                          color: catList[i] == "Todas"
                              ? const Color(0XFFF7F8FA)
                              : Colors.grey,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 60),

//IMAGENES DE LAS ROPAS
          Padding(
            padding: const EdgeInsets.only(top: 400),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio:
                    (MediaQuery.of(context).size.width - 30 - 15) / (2 * 290),
                mainAxisSpacing: 45,
                crossAxisSpacing: 10,
              ),
              itemCount: imgList.length,
              itemBuilder: (_, i) {
                if (i % 2 == 0) {
                  return ProductCard(imgList[i]);
                }
                return OverflowBox(
                  maxHeight: 290.0 + 70.0,
                  child: Container(
                    margin: const EdgeInsets.only(top: 70),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ProductCard(imgList[i]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
