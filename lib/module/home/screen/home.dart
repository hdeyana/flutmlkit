import 'package:flutmlkit/module/home/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('ML Demo'),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: <Widget>[
              Text('asdas'),
            ],
          ),
        );
      },
    );
  }
}
