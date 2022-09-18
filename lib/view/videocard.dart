
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:machinetestlive/model/video_model.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulWidget {
  final Datum video;
  const VideoCard({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  VideoPlayerController? _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(widget.video.postUrl);
    _videoPlayerController!.addListener(() {
      setState(() {});
    });
    _videoPlayerController!.setLooping(true);

    _videoPlayerController!.initialize().then((value) {
      setState(() {
       _videoPlayerController!.play();
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return videoplayer();

  }

  Widget videoplayer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _videoPlayerController!.value.isInitialized
          ? Column(
            children: [
              // Text(widget.video.),
              AspectRatio(
                  aspectRatio: _videoPlayerController!.value.aspectRatio,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: VideoPlayer(_videoPlayerController!),
                  ),
                ),
            ],
          )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.black,
                child: const Center(child: CircularProgressIndicator.adaptive()),
              ),
            ),
    );
  }
}
