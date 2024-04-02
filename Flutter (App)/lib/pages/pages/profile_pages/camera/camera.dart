import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../clothes/clothes.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  List<CameraDescription>? _cameras;
  int _selectedCameraIndex = 0;
  bool _isFrontCamera = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras![_selectedCameraIndex],
      ResolutionPreset.high,
    );

    await _cameraController.initialize();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void _switchCamera() {
    _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras!.length;
    _isFrontCamera = _cameras![_selectedCameraIndex].lensDirection ==
        CameraLensDirection.front;
    _cameraController = CameraController(
      _cameras![_selectedCameraIndex],
      ResolutionPreset.high,
    );
    _cameraController.initialize().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cameras == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (!_cameraController.value.isInitialized) {
      return const Scaffold(
        body: Center(
          child: Text(
            'Loading',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: _cameraController.value.aspectRatio,
              child: CameraPreview(_cameraController),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),

              //TEXTO CAMARA
              child: Text(
                'Cámara',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'JoseFinSans-Regular',
                ),
              ),
            ),
          ),

          //BOTONES PARA VOLVER
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(
                        milliseconds: 500), // Duración de la animación
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ClothesPage(), // Página de destino
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // Personaliza la animación aquí
                      var begin = const Offset(
                          1.0, 0.0); // Posición inicial de la página de destino
                      var end =
                          Offset.zero; // Posición final de la página de destino
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
            ),
          ),

          //BOTONES PARA SACAR FOTO Y DAR VUELTA LA CAMARA
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 100,
                  ),
                  child: FloatingActionButton(
                    heroTag: UniqueKey(),
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      // Agrega la lógica para tomar la foto
                    },
                    child: const Icon(
                      Icons.circle_outlined,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                ),
                FloatingActionButton(
                  heroTag: UniqueKey(),
                  backgroundColor: Colors.transparent,
                  onPressed: _switchCamera,
                  child: Icon(
                    _isFrontCamera ? Icons.autorenew : Icons.cached_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class CameraScreen extends StatefulWidget {
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//  late CameraController _cameraController;
// List<CameraDescription>? _cameras;

//   @override
// void initState() {
//   super.initState();
//   _initializeCamera();
// }

// void _initializeCamera() async {
//   _cameras = await availableCameras();
//   _cameraController = CameraController(_cameras![0], ResolutionPreset.high);

//   await _cameraController.initialize();

//   if (mounted) {
//     setState(() {});
//   }
// }

// @override
// void dispose() {
//   _cameraController.dispose();
//   super.dispose();
// }
//   @override
// Widget build(BuildContext context) {
//   if (_cameras == null) {
//     return Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   } else if (!_cameraController.value.isInitialized) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Loading',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20.0,
//             fontWeight: FontWeight.w900,
//           ),
//         ),
//       ),
//     );
//   }

//   return Scaffold(

//     body: Column(
//       children: [
//         Expanded(
//           child: AspectRatio(
//             aspectRatio: _cameraController.value.aspectRatio,
//             child: CameraPreview(_cameraController),
//           ),
//         ),
//       ],
//     ),
//   );
// }
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final cameras = await availableCameras();
//   final firstCamera = cameras.first;

//   runApp(MaterialApp(
//     home: CameraScreen(camera: firstCamera),
//   ));
// }

// class CameraScreen extends StatefulWidget {
//   final CameraDescription camera;

//   const CameraScreen({required this.camera});

//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//   bool _isRecording = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(
//       widget.camera,
//       ResolutionPreset.medium,
//     );
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> _takePicture() async {
//     try {
//       await _initializeControllerFuture;
//       final path = join(
//         (await getTemporaryDirectory()).path,
//         '${DateTime.now()}.png',
//       );
//       await _controller.takePicture(path);
//       // Aquí puedes hacer algo con la foto capturada
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> _startRecording() async {
//     if (!_controller.value.isRecordingVideo) {
//       try {
//         await _initializeControllerFuture;
//         final path = join(
//           (await getTemporaryDirectory()).path,
//           '${DateTime.now()}.mp4',
//         );
//         await _controller.startVideoRecording(path);
//         setState(() {
//           _isRecording = true;
//         });
//       } catch (e) {
//         print(e);
//       }
//     }
//   }

//   Future<void> _stopRecording() async {
//     if (_controller.value.isRecordingVideo) {
//       try {
//         await _controller.stopVideoRecording();
//         setState(() {
//           _isRecording = false;
//         });
//         // Aquí puedes hacer algo con el video grabado
//       } catch (e) {
//         print(e);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Camera App'),
//       ),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return CameraPreview(_controller);
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             child: Icon(Icons.camera),
//             onPressed: _takePicture,
//           ),
//           SizedBox(height: 16),
//           FloatingActionButton(
//             child: Icon(_isRecording ? Icons.stop : Icons.videocam),
//             onPressed: _isRecording ? _stopRecording : _startRecording,
//           ),
//         ],
//       ),
//     );
//   }

//   join(String path, String s) {}
