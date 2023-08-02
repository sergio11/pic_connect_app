import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:pic_connect/utils/colors.dart';

class CameraWidget extends StatefulWidget {

  final Function(String filePath) onTakePhotoPressed;
  final Function(String filePath) onRecordVideoPressed;

  const CameraWidget({
    Key? key,
    required this.onTakePhotoPressed,
    required this.onRecordVideoPressed
  }) : super(key: key);

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> with WidgetsBindingObserver {

  CameraController? _controller;
  bool _isCameraInitialized = false;
  late final List<CameraDescription> _cameras;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initCamera();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    final CameraController? cameraController = _controller;
    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isCameraInitialized) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: mobileBackgroundColor,
          body: Stack(
            fit: StackFit.expand,
            children: [
              CameraPreview(_controller!),
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!_isRecording)
                      ElevatedButton(
                        onPressed: _onTakePhotoPressed,
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(70, 70),
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    if (!_isRecording) const SizedBox(width: 15),
                    ElevatedButton(
                      onPressed:_isRecording? null: _onRecordVideoPressed,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(70, 70),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.white),
                      child: Icon(
                        _isRecording ? Icons.stop : Icons.videocam,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    // Initialize the camera with the first camera in the list
    await onNewCameraSelected(_cameras.first);
  }

  Future<XFile?> capturePhoto() async {
    final CameraController? cameraController = _controller;
    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }
    try {
      await cameraController.setFlashMode(FlashMode.off);
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      debugPrint('Error occurred while taking picture: $e');
      return null;
    }
  }

  Future<XFile?> captureVideo() async {
    final CameraController? cameraController = _controller;
    try {
      setState(() {
        _isRecording = true;
      });
      await cameraController?.startVideoRecording();
      await Future.delayed(const Duration(seconds: 15));
      final video = await cameraController?.stopVideoRecording();
      setState(() {
        _isRecording = false;
      });
      return video;
    } on CameraException catch (e) {
      debugPrint('Error occurred while taking picture: $e');
      return null;
    }
  }

  void _onTakePhotoPressed() async {
    final xFile = await capturePhoto();
    if (xFile != null) {
      if (xFile.path.isNotEmpty) {
        widget.onTakePhotoPressed(xFile.path);
      }
    }
  }

  void _onRecordVideoPressed() async {
    debugPrint("captureVideo started!");
    final xFile = await captureVideo();
    debugPrint("captureVideo xFile: ${xFile?.path} finished!");
    if (xFile != null) {
      if (xFile.path.isNotEmpty) {
        widget.onRecordVideoPressed(xFile.path);
      }
    }
  }

  Future<void> onNewCameraSelected(CameraDescription description) async {
    final previousCameraController = _controller;

    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      description,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      debugPrint('Error initializing camera: $e');
    }
    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        _controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = _controller!.value.isInitialized;
      });
    }
  }
}
