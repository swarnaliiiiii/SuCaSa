import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:async';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
    print("Available cameras: ${cameras.length}");
  } catch (e) {
    print('Error initializing cameras: $e');
  }
  runApp(CameraApp());
}

class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: cameras.isEmpty ? NoCameraPage() : CameraPage(),
    );
  }
}

class NoCameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("No Camera Available")),
      body: Center(
        child: Text(
          'No camera available on this device.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  bool _isRearCamera = true;
  bool _isCameraInitialized = false;
  XFile? imageFile;

  @override
  void initState() {
    super.initState();
    if (cameras.isNotEmpty) {
      _initializeCamera();
    } else {
      print("No cameras found!");
    }
  }

  Future<void> _initializeCamera() async {
    _controller = CameraController(
      cameras[_isRearCamera ? 0 : 1], // 0 = rear camera, 1 = front camera
      ResolutionPreset.high,
    );

    try {
      await _controller?.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _switchCamera() async {
    if (cameras.length > 1) {
      setState(() {
        _isRearCamera = !_isRearCamera;
      });
      await _initializeCamera();
    } else {
      print("Only one camera available.");
    }
  }

  void _captureImage() async {
    if (_controller != null && _controller!.value.isInitialized) {
      XFile file = await _controller!.takePicture();
      setState(() {
        imageFile = file;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isCameraInitialized
          ? Stack(
              children: [
                CameraPreview(_controller!),
                // Grid overlay
                _buildGridOverlay(),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.flip_camera_android, size: 30),
                    onPressed: _switchCamera,
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _captureImage,
                        child: Text("Generate"),
                        style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  // Function to build grid overlay
  Widget _buildGridOverlay() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: List.generate(3, (index) {
            return Expanded(
              child: Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54, width: 0.5),
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        );
      },
    );
  }
}
