// // ignore: file_names
// import 'package:firebase_auth/firebase_auth.dart';

// //Logica de Autenticación
// class FireBaseAuth {
//   //Creating new instance of firebase Auth
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> registerWithEmailAndPassword(
//       //Creación del método
//       String email,
//       String password,
//       String name) async {
//     final user = await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     //You can also store the user in Database
//   }

//   Future<void> signInWithEmailAndPassword(String email, String password) async {
//     final user = await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     //You can also store the user in Database
//   }
// }
