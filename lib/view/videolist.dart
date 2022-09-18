import 'dart:developer';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetestlive/controller/video_controller.dart';
import 'package:machinetestlive/view/videocard.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  // VideoController? controller;
  // @override
  // void initState() {
  //   controller = Get.find<VideoController>()..getData()

  //   super.initState();
  // }
VideoController controller=Get.put(VideoController());
  @override
  Widget build(BuildContext context) {
    log('hello');
    log(controller.videoList.length.toString());
    return Scaffold(
      body: SafeArea(
          child: 
           GetBuilder<VideoController>(
               init: VideoController(),
               builder: (controller) {
                 return ListView.builder(
                   itemCount: controller.videoList.length,
                   itemBuilder: (BuildContext context, int index) {
                     return  VideoCard(video: controller.videoList[index]);
                   },
                 );
               })),
    );
  }
}
