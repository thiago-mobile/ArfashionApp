import 'package:desk_login/pages/pages/profile_pages/camera/camera.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  List sizes = [
    'S',
    'M',
    'L',
    'XL',
  ];

  @override
  Widget build(BuildContext context) {
//container fondo
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),

          //TEXTO TALLE
          Row(
            children: [
              const Text(
                "Talle: ",
                style: TextStyle(fontSize: 17, fontFamily: 'JoseFinSans-Bold'),
              ),
              const SizedBox(width: 30),
              for (int i = 0; i < sizes.length; i++)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(sizes[i]),
                ),
            ],
          ),
          const SizedBox(width: 30),

//texto color
          Row(
            children: [
              const Text(
                "color: ",
                style: TextStyle(fontSize: 17, fontFamily: 'JoseFinSans-Bold'),
              ),
              const SizedBox(
                width: 30,
                height: 40,
              ),

//colores circulos
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: const Color(0xFF023E8B),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: const Color(0xFF000000),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF0202),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),

//boton de probar en camera
          InkWell(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return CustomBottomSheet();
                },
              );

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CameraScreen()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xffC44BC1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Probar en cámara",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      fontFamily: 'JoseFinSans-Bold',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
