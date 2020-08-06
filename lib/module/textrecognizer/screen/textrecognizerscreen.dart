import 'package:camera/camera.dart';
import 'package:flutmlkit/module/textrecognizer/controller/textrecognizercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextRecognizerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextRecognizerController>(
      init: TextRecognizerController(),
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
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          child: Text('Work better when potrait'),
                        )),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 200,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(c.resultText ?? ""),
                      ),
                    ),
                  ],
                )
              : Container(),
        );
      },
    );
  }
}
