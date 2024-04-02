import 'package:desk_login/pages/pages/profile_pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PurchaseHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2222222),
      appBar: AppBar(
        backgroundColor: Color(0xff2222222),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
//Container PRIMARIO
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //PRECIO
                      Text(
                        "\$2589.90",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/alancito.jpg",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

//Dinero gastado
                  Text(
                    "Dinero gastado",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  //BOTONES PRINCIPALES ENVIADO, RECIBIDA, PRESTAMO
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 245, 248, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18))),
                              child: Icon(
                                Icons.date_range,
                                color: Colors.blue[900],
                                size: 30,
                              ),
                              padding: EdgeInsets.all(12),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Enviado",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.blue[100]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 245, 248, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18))),
                              child: Icon(
                                Icons.public,
                                color: Colors.blue[900],
                                size: 30,
                              ),
                              padding: EdgeInsets.all(12),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Recibida",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.blue[100]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 245, 248, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18))),
                              child: Icon(
                                Icons.attach_money,
                                color: Colors.blue[900],
                                size: 30,
                              ),
                              padding: EdgeInsets.all(12),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Prestamo",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.blue[100]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 245, 248, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18))),
                              child: Icon(
                                Icons.trending_down,
                                color: Colors.blue[900],
                                size: 30,
                              ),
                              padding: EdgeInsets.all(12),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Recargar",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.blue[100]),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            //draggable sheet
            DraggableScrollableSheet(
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 245, 248, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 24,
                        ),
//CONTAINER TRANSACCIONES Y VER TO
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Transacciones ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 24,
                                    color: Colors.black),
                              ),
                              Text(
                                "Ver todo",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.blue[800]),
                              )
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                        ),
                        SizedBox(
                          height: 24,
                        ),

//Container PARA LOS BOTONES
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Todos",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.grey[900]),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10.0,
                                          spreadRadius: 4.5)
                                    ]),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Gastos",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Colors.grey[900]),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10.0,
                                          spreadRadius: 4.5)
                                    ]),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),
//Container DONDE SE VEN TODOS LOS REGISTROS
                        Container(
                          child: Text(
                            "HOY",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[500]),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 32),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18))),
                                    child: Icon(
                                      Icons.shopping_bag_sharp,
                                      color: Colors.lightBlue[900],
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Adidas",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey[900]),
                                        ),
                                        Text(
                                          "Pantalon",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey[500]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "+\$500.5",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.lightGreen),
                                      ),
                                      Text(
                                        "26 Jun",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          shrinkWrap: true,
                          itemCount: 2,
                          padding: EdgeInsets.all(0),
                          controller: ScrollController(keepScrollOffset: false),
                        ),

                        //now expense
                        SizedBox(
                          height: 16,
                        ),

                        Container(
                          child: Text(
                            "AYER",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[500]),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 32),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18))),
                                    child: Icon(
                                      Icons.shopping_bag,
                                      color: Colors.lightBlue[900],
                                    ),
                                    padding: EdgeInsets.all(12),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Nike ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey[900]),
                                        ),
                                        Text(
                                          "Remera",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey[500]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "-\$500.5",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.red),
                                      ),
                                      Text(
                                        "26 Jun",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          shrinkWrap: true,
                          itemCount: 2,
                          padding: EdgeInsets.all(0),
                          controller: ScrollController(keepScrollOffset: false),
                        ),

                        //now expense
                      ],
                    ),
                    controller: scrollController,
                  ),
                );
              },
              initialChildSize: 0.65,
              minChildSize: 0.65,
              maxChildSize: 1,
            )
          ],
        ),
      ),
    );
  }
}


// return Container(
//       height: MediaQuery.of(context).size.height,
//       width: double.infinity,
//       child: Stack(
//         children: <Widget>[
//           //Container for top data
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(
//                       "\$2589.90",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 36,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     Container(
//                       child: Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.notifications,
//                             color: Colors.lightBlue[100],
//                           ),
//                           SizedBox(
//                             width: 16,
//                           ),
//                           CircleAvatar(
//                             radius: 25,
//                             backgroundColor: Colors.white,
//                             child: ClipOval(
//                               child: Image.asset(
//                                 "assets/alancito.jpg",
//                                 fit: BoxFit.contain,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 Text(
//                   "Available Balance",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 16,
//                       color: Colors.blue[100]),
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Container(
//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: Color.fromRGBO(243, 245, 248, 1),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(18))),
//                             child: Icon(
//                               Icons.date_range,
//                               color: Colors.blue[900],
//                               size: 30,
//                             ),
//                             padding: EdgeInsets.all(12),
//                           ),
//                           SizedBox(
//                             height: 4,
//                           ),
//                           Text(
//                             "Send",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 14,
//                                 color: Colors.blue[100]),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: Color.fromRGBO(243, 245, 248, 1),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(18))),
//                             child: Icon(
//                               Icons.public,
//                               color: Colors.blue[900],
//                               size: 30,
//                             ),
//                             padding: EdgeInsets.all(12),
//                           ),
//                           SizedBox(
//                             height: 4,
//                           ),
//                           Text(
//                             "Request",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 14,
//                                 color: Colors.blue[100]),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: Color.fromRGBO(243, 245, 248, 1),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(18))),
//                             child: Icon(
//                               Icons.attach_money,
//                               color: Colors.blue[900],
//                               size: 30,
//                             ),
//                             padding: EdgeInsets.all(12),
//                           ),
//                           SizedBox(
//                             height: 4,
//                           ),
//                           Text(
//                             "Loan",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 14,
//                                 color: Colors.blue[100]),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(
//                                 color: Color.fromRGBO(243, 245, 248, 1),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(18))),
//                             child: Icon(
//                               Icons.trending_down,
//                               color: Colors.blue[900],
//                               size: 30,
//                             ),
//                             padding: EdgeInsets.all(12),
//                           ),
//                           SizedBox(
//                             height: 4,
//                           ),
//                           Text(
//                             "Topup",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 14,
//                                 color: Colors.blue[100]),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),

//           //draggable sheet
//           DraggableScrollableSheet(
//             builder: (context, scrollController) {
//               return Container(
//                 decoration: BoxDecoration(
//                     color: Color.fromRGBO(243, 245, 248, 1),
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(40),
//                         topRight: Radius.circular(40))),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       SizedBox(
//                         height: 24,
//                       ),
//                       Container(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Text(
//                               "Recent Transactions",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w900,
//                                   fontSize: 24,
//                                   color: Colors.black),
//                             ),
//                             Text(
//                               "See all",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 16,
//                                   color: Colors.grey[800]),
//                             )
//                           ],
//                         ),
//                         padding: EdgeInsets.symmetric(horizontal: 32),
//                       ),
//                       SizedBox(
//                         height: 24,
//                       ),

//                       //Container for buttons
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 32),
//                         child: Row(
//                           children: <Widget>[
//                             Container(
//                               child: Text(
//                                 "All",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 14,
//                                     color: Colors.grey[900]),
//                               ),
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(20)),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.grey,
//                                         blurRadius: 10.0,
//                                         spreadRadius: 4.5)
//                                   ]),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 10),
//                             ),
//                             SizedBox(
//                               width: 16,
//                             ),
//                             Container(
//                               child: Row(
//                                 children: <Widget>[
//                                   CircleAvatar(
//                                     radius: 8,
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   SizedBox(
//                                     width: 8,
//                                   ),
//                                   Text(
//                                     "Income",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 14,
//                                         color: Colors.grey[900]),
//                                   ),
//                                 ],
//                               ),
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(20)),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.grey,
//                                         blurRadius: 10.0,
//                                         spreadRadius: 4.5)
//                                   ]),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 10),
//                             ),
//                             SizedBox(
//                               width: 16,
//                             ),
//                             Container(
//                               child: Row(
//                                 children: <Widget>[
//                                   CircleAvatar(
//                                     radius: 8,
//                                     backgroundColor: Colors.orange,
//                                   ),
//                                   SizedBox(
//                                     width: 8,
//                                   ),
//                                   Text(
//                                     "Expenses",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 14,
//                                         color: Colors.grey[900]),
//                                   ),
//                                 ],
//                               ),
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(20)),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.grey,
//                                         blurRadius: 10.0,
//                                         spreadRadius: 4.5)
//                                   ]),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 10),
//                             )
//                           ],
//                         ),
//                       ),

//                       SizedBox(
//                         height: 16,
//                       ),
//                       //Container Listview for expenses and incomes
//                       Container(
//                         child: Text(
//                           "TODAY",
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.grey[500]),
//                         ),
//                         padding: EdgeInsets.symmetric(horizontal: 32),
//                       ),

//                       SizedBox(
//                         height: 16,
//                       ),

//                       ListView.builder(
//                         itemBuilder: (context, index) {
//                           return Container(
//                             margin: EdgeInsets.symmetric(horizontal: 32),
//                             padding: EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(20))),
//                             child: Row(
//                               children: <Widget>[
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.grey[100],
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(18))),
//                                   child: Icon(
//                                     Icons.date_range,
//                                     color: Colors.lightBlue[900],
//                                   ),
//                                   padding: EdgeInsets.all(12),
//                                 ),
//                                 SizedBox(
//                                   width: 16,
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       Text(
//                                         "Payment",
//                                         style: TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w700,
//                                             color: Colors.grey[900]),
//                                       ),
//                                       Text(
//                                         "Payment from Saad",
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w700,
//                                             color: Colors.grey[500]),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: <Widget>[
//                                     Text(
//                                       "+\$500.5",
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w700,
//                                           color: Colors.lightGreen),
//                                     ),
//                                     Text(
//                                       "26 Jan",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w700,
//                                           color: Colors.grey[500]),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                         shrinkWrap: true,
//                         itemCount: 2,
//                         padding: EdgeInsets.all(0),
//                         controller: ScrollController(keepScrollOffset: false),
//                       ),

//                       //now expense
//                       SizedBox(
//                         height: 16,
//                       ),

//                       Container(
//                         child: Text(
//                           "YESTERDAY",
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.grey[500]),
//                         ),
//                         padding: EdgeInsets.symmetric(horizontal: 32),
//                       ),

//                       SizedBox(
//                         height: 16,
//                       ),

//                       ListView.builder(
//                         itemBuilder: (context, index) {
//                           return Container(
//                             margin: EdgeInsets.symmetric(horizontal: 32),
//                             padding: EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(20))),
//                             child: Row(
//                               children: <Widget>[
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.grey[100],
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(18))),
//                                   child: Icon(
//                                     Icons.directions_car,
//                                     color: Colors.lightBlue[900],
//                                   ),
//                                   padding: EdgeInsets.all(12),
//                                 ),
//                                 SizedBox(
//                                   width: 16,
//                                 ),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       Text(
//                                         "Petrol",
//                                         style: TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w700,
//                                             color: Colors.grey[900]),
//                                       ),
//                                       Text(
//                                         "Payment from Saad",
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w700,
//                                             color: Colors.grey[500]),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: <Widget>[
//                                     Text(
//                                       "-\$500.5",
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w700,
//                                           color: Colors.orange),
//                                     ),
//                                     Text(
//                                       "26 Jan",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w700,
//                                           color: Colors.grey[500]),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                         shrinkWrap: true,
//                         itemCount: 2,
//                         padding: EdgeInsets.all(0),
//                         controller: ScrollController(keepScrollOffset: false),
//                       ),

//                       //now expense
//                     ],
//                   ),
//                   controller: scrollController,
//                 ),
//               );
//             },
//             initialChildSize: 0.65,
//             minChildSize: 0.65,
//             maxChildSize: 1,
//           )
//         ],
//       ),
//     );




// class PurchaseHistory extends StatefulWidget {
//   const PurchaseHistory({super.key});

//   @override
//   State<PurchaseHistory> createState() => _PurchaseHistoryState();
// }

// class _PurchaseHistoryState extends State<PurchaseHistory> {
//   bool isPressed = false;
//   bool isButtonDisabled = true;
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color(0xff222222),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => ProfilePage()));
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.white,
//             )),
//         automaticallyImplyLeading: false,
//         title: Text(
//           'Agregar metodo de pago',
//           style: TextStyle(
//               fontFamily: 'JoseFinSans-SemiBold', color: Colors.white),
//         ),
//       ),
//       resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: Column(
//           children: [
//             CreditCardWidget(
//               cardNumber: cardNumber,
//               expiryDate: expiryDate,
//               cardHolderName: cardHolderName,
//               cvvCode: cvvCode,
//               showBackView: isCvvFocused,
//               obscureCardNumber: true,
//               obscureCardCvv: true,
//               onCreditCardWidgetChange: (CreditCardBrand) {},
//             ),
//             Expanded(
//                 child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   CreditCardForm(
//                     cardNumber: cardNumber,
//                     expiryDate: expiryDate,
//                     cardHolderName: cardHolderName,
//                     cvvCode: cvvCode,
//                     onCreditCardModelChange: onCreditCardModelChange,
//                     themeColor: Colors.black,
//                     formKey: formKey,
//                     cardNumberDecoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Numero',
//                         hintText: 'xxxx xxxx xxxx xxxx'),
//                     expiryDateDecoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Vence',
//                         hintText: 'xx/xx'),
//                     cvvCodeDecoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'CVV',
//                         hintText: 'xxx'),
//                     cardHolderDecoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Card Holder',
//                     ),
//                   ),
//                   // ElevatedButton(
//                   //   style: ElevatedButton.styleFrom(
//                   //       shape: RoundedRectangleBorder(
//                   //         borderRadius: BorderRadius.circular(8.0),
//                   //       ),
//                   //       primary: const Color(0xff1b447b)),
//                   //   child: Container(
//                   //     margin: const EdgeInsets.all(8.0),
//                   //     child: const Text(
//                   //       'validate',
//                   //       style: TextStyle(
//                   //         color: Colors.white,
//                   //         fontFamily: 'halter',
//                   //         fontSize: 14,
//                   //         package: 'flutter_credit_card',
//                   //       ),
//                   //     ),
//                   //   ),
//                   //   onPressed: () {
//                   //     if (formKey.currentState!.validate()) {
//                   //       print('valid');
//                   //     } else {
//                   //       print('inValid');
//                   //     }
//                   //   },
//                   // )
//                   GestureDetector(
//                     onTapDown: (_) {
//                       setState(() {
//                         isPressed = true;
//                       });
//                     },
//                     onTapUp: (_) {
//                       setState(() {
//                         isPressed = false;
//                       });
//                     },
//                     onTapCancel: () {
//                       setState(() {
//                         isPressed = false;
//                       });
//                     },
//                     onTap: isButtonDisabled
//                         ? null
//                         : () async {
//                             try {
//                               setState(() {
//                                 if (formKey.currentState!.validate()) {
//                                   print('valid');
//                                 } else {
//                                   print('inValid');
//                                 }
//                               });
//                             } catch (e) {
//                               print('Error de inicio de sesión: $e');
//                             }
//                             setState(() {
//                               // signIn();
//                             });
//                           },
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             right: 15,
//                             left: 20,
//                             top: 45,
//                             bottom: 0,
//                           ),
//                           child: Container(
//                             height: 60,
//                             width: 320,
//                             decoration: BoxDecoration(
//                               color: Colors.black,
//                               borderRadius: BorderRadius.circular(30),
//                               boxShadow: isPressed
//                                   ? [
//                                       BoxShadow(
//                                         color: Colors.purple.withOpacity(0.7),
//                                         spreadRadius: 2,
//                                         blurRadius: 10,
//                                         offset: const Offset(0, 3),
//                                       ),
//                                     ]
//                                   : null,
//                             ),
//                             child: const Center(
//                               child: Padding(
//                                 padding: EdgeInsets.only(top: 0),
//                                 child: Text(
//                                   'Validar',
//                                   style: TextStyle(
//                                     fontFamily: 'JosefinSans-SemiBold',
//                                     fontSize: 20,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//           ],
//         ),
//       ),
//     );
//   }

//   void onCreditCardModelChange(CreditCardModel creditCardModel) {
//     setState(() {
//       cardNumber = creditCardModel.cardNumber;
//       expiryDate = creditCardModel.expiryDate;
//       cardHolderName = creditCardModel.cardHolderName;
//       cvvCode = creditCardModel.cvvCode;
//       isCvvFocused = creditCardModel.isCvvFocused;
//     });
//   }
// }
