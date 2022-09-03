import 'dart:convert';
import 'dart:developer';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:machinetestlive/model/apicore.dart';
import 'package:machinetestlive/model/video_model.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  List<Datum> videoList = [];
  var isLoading = true.obs;
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
 
  @override
  void onInit() {
    getData();
    super.onInit();
  }
 @override
void onClose()async{
videoPlayerController.dispose();
chewieController!.dispose();
}
  getData() async {
    isLoading.value = true;
    try {
      var response = await http.get(
        Uri.parse(
            '${apiEndPoints().videoUrl}post/getreelswithoutlogincheck?limit=5&page=1}'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        videoList = videoModelFromJson(response.body).data;
       videoPlayerController=VideoPlayerController.network(videoList[0].postUrl);
       await Future.wait([videoPlayerController.initialize()]);
       chewieController=ChewieController(videoPlayerController: videoPlayerController,autoPlay: true,autoInitialize: true);
        isLoading.value = false;
            update();
      }
    } catch (e) {
      log(e.toString());
    }
  }

playvideo(String url)async{
  videoPlayerController=VideoPlayerController.network(url);
       await Future.wait([videoPlayerController.initialize()]);
       chewieController=ChewieController(videoPlayerController: videoPlayerController,autoPlay: true,autoInitialize: true);
       update();
       return videoPlayerController;
}  
}
