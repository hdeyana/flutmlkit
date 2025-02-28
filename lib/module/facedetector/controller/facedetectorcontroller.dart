import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutmlkit/application/basecontroller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FaceDetectorController extends BaseController {
  CameraController cameraController;
  List<CameraDescription> cameras = [];
  final FaceDetector faceDetector = FirebaseVision.instance.faceDetector(
    FaceDetectorOptions(enableClassification: true, mode: FaceDetectorMode.accurate, enableTracking: true),
  );
  bool _mounted = true;
  bool _isDetecting = false;
  double smilingProbability = 0;
  Rect faceRect;
  int numberOfFaces = 0;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onClose() {
    super.onClose();
    close();
  }

  close() async {
    _mounted = false;
    await cameraController.dispose();
    await faceDetector.close();
  }

  init() async {
    try {
      cameras = await availableCameras();
      final c = cameras[1] != null ? cameras[1] : cameras[0];
      onNewCameraSelected(c);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }
    cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await cameraController.initialize();
      startStream();
    } on CameraException catch (e) {
      print(e);
    }
    update();
  }

  startStream() {
    try {
      cameraController.startImageStream((data) async {
        if (_mounted && !_isDetecting) {
          if (_isDetecting) return;

          _isDetecting = true;

          final image = FirebaseVisionImage.fromBytes(_concatenatePlanes(data.planes), _buildMetaData(data));
          final List<Face> faces = await faceDetector.processImage(image);
          _isDetecting = false;
          if (faces.isNotEmpty) {
            smilingProbability = faces[0].smilingProbability;
            faceRect = faces[0].boundingBox;
            numberOfFaces = faces.length;

            if (_mounted) update();
          }
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Uint8List _concatenatePlanes(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in planes) {
      allBytes.putUint8List(plane.bytes);
    }
    return allBytes.done().buffer.asUint8List();
  }

  FirebaseVisionImageMetadata _buildMetaData(
    CameraImage image,
  ) {
    return FirebaseVisionImageMetadata(
      rawFormat: image.format.raw,
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: _rotationIntToImageRotation(),
      planeData: image.planes.map(
        (Plane plane) {
          return FirebaseVisionImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList(),
    );
  }

  ImageRotation _rotationIntToImageRotation() {
    switch (cameras[1].sensorOrientation) {
      case 0:
        return ImageRotation.rotation0;
      case 90:
        return ImageRotation.rotation90;
      case 180:
        return ImageRotation.rotation180;
      default:
        assert(cameras[1].sensorOrientation == 270);
        return ImageRotation.rotation270;
    }
  }
}
