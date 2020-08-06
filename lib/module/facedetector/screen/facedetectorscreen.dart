import 'package:camera/camera.dart';
import 'package:flutmlkit/module/facedetector/controller/facedetectorcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaceDetectorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaceDetectorController>(
      init: FaceDetectorController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.black,
          body: c.cameraController != null
              ? Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: AspectRatio(
                        aspectRatio: c.cameraController.value.aspectRatio,
                        child: CameraPreview(c.cameraController),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Number of Faces ${c.numberOfFaces}',
                              style: Theme.of(context).textTheme.headline5.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            Text(
                              'Smiling Prob ${c.smilingProbability.toStringAsFixed(2) ?? 0}',
                              style: Theme.of(context).textTheme.headline3.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ))
                  ],
                )
              : Container(),
        );
      },
    );
  }
}
