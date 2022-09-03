import 'dart:developer';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetestlive/controller/video_controller.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  // VideoController? controller;
  // @override
  // void initState() {
  //   controller = Get.find<VideoController>()..getData();
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
           Column(
        children: [
          GetBuilder<VideoController>(
              init: VideoController(),
              builder: (controller) {
                return Expanded(
                  child: Center(
                    child: controller.chewieController != null &&
                            controller.chewieController!.videoPlayerController
                                .value.isInitialized
                        ? Chewie(controller: controller.chewieController!)
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:const [
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 30,
                              ),
                              Text('Loading')
                            ],
                          ),
                  ),
                );
              })
        ],
      )),
    );
  }
}
