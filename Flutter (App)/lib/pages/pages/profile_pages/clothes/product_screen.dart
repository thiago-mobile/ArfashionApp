import 'package:desk_login/pages/pages/profile_pages/camera/camera.dart';
import 'package:desk_login/pages/pages/profile_pages/clothes/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductScreen extends StatelessWidget {
  List sizes = [
    ' S ',
    ' M ',
    ' L ',
    'XL',
  ];

  String img;
  ProductScreen(this.img);

  final int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 450,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage(
                    "assets/RopaPage/Marcas/Nike/Prendas/${img}.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        size: 22,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 15, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        img,
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontFamily: 'JoseFinSans-SemiBold',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                RatingBar.builder(
                  unratedColor: Colors.grey,
                  itemSize: 28,
                  initialRating: 3.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                  onRatingUpdate: (rating) {},
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff222222),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text(
                            "Talle: ",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'JoseFinSans-Bold',
                                color: Colors.white),
                          ),
                          const SizedBox(width: 30),
                          for (int i = 0; i < sizes.length; i++)
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Text(sizes[i]),
                            ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Row(
                        children: [
                          const Text(
                            "Color: ",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'JoseFinSans-Bold',
                                color: Colors.white),
                          ),
                          const SizedBox(
                            width: 30,
                            height: 60,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
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
                        height: 0,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return CustomBottomSheet();
                            },
                          );

                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CameraScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
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
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}


// InkWell(
//                   onTap: (){},
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 20,horizontal: 100),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFDD50DB),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Text(
//                       "Probar",
//                       style: TextStyle(
//                         fontSize: 17,
//                         fontFamily: 'JoseFinSans-Bold',
//                         letterSpacing: 1,

                      
                      
//                       ),
                    
                    
//                     ),
//                   ),
//                 )