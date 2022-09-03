import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetestlive/controller/video_controller.dart';
import 'package:machinetestlive/view/videolist.dart';


class Mainpage extends StatelessWidget {
   Mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Center(
      child: ElevatedButton(onPressed: (){
        Get.to(const VideoList());
      }, child: const Text('Click to view video List')),
    )),);
  }
}