import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';

class CameraPreviewScreen extends StatefulWidget {
  final bool useFrontCamera;
  const CameraPreviewScreen({super.key, this.useFrontCamera = false});

  @override
  State<CameraPreviewScreen> createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isNotEmpty) {
        CameraDescription selectedCamera = _cameras.first;
        if (widget.useFrontCamera) {
          final frontCamera = _cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front,
            orElse: () => _cameras.first,
          );
          selectedCamera = frontCamera;
        }

        _controller = CameraController(
          selectedCamera,
          ResolutionPreset.high,
          enableAudio: false,
        );

        await _controller!.initialize();
        if (mounted) {
          setState(() {
            _isReady = true;
          });
        }
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  Future<void> _toggleCamera() async {
    if (_cameras.length < 2 || _controller == null) return;
    
    int nextIndex = 0;
    for (int i = 0; i < _cameras.length; i++) {
      if (_cameras[i].lensDirection == _controller!.description.lensDirection) {
        nextIndex = (i + 1) % _cameras.length;
        break;
      }
    }
    
    final nextCamera = _cameras[nextIndex];
    setState(() {
      _isReady = false;
    });
    
    await _controller!.dispose();
    _controller = CameraController(
      nextCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    
    try {
      await _controller!.initialize();
      if (mounted) {
        setState(() {
          _isReady = true;
        });
      }
    } catch (e) {
      debugPrint('Error switching camera: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }

    if (_controller!.value.isTakingPicture) {
      return;
    }

    try {
      final XFile picture = await _controller!.takePicture();
      if (mounted) {
        context.pop(picture.path);
      }
    } catch (e) {
      debugPrint('Error capturing picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady || _controller == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primary500),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: CameraPreview(_controller!),
            ),
            // Top Left UI (Close Button)
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 28),
                onPressed: () => context.pop(),
              ),
            ),
            // Top Right UI (Toggle Camera Button)
            if (_cameras.length > 1)
              Positioned(
                top: 16,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.flip_camera_ios_rounded, color: Colors.white, size: 28),
                  onPressed: _toggleCamera,
                ),
              ),
            // Bottom UI
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: _takePicture,
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                    child: Center(
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
