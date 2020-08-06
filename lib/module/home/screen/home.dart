import 'package:flutmlkit/common/widget/bannerbutton.dart';
import 'package:flutmlkit/module/home/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            title: Text('ML Demo'),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: <Widget>[
              BannerButton(
                title: 'Face Detector',
                img: 'https://images.unsplash.com/photo-1591404467888-f41d7efb5809?ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80',
                onTap: () => c.gotoFaceDetector(),
              ),
            ],
          ),
        );
      },
    );
  }
}
