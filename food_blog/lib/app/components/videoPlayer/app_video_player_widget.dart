import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayerWidget {
  final VideoPlayerController videoPlayerController;

  AppVideoPlayerWidget(this.videoPlayerController);

  Widget build() {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: videoPlayerController.value.aspectRatio,
          child: VideoPlayer(videoPlayerController),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.keyboard_double_arrow_left_rounded, color: Colors.white,),
                onPressed: () {
                  videoPlayerController.seekTo(videoPlayerController.value.position - const Duration(seconds: 5));
                },
              ),
              IconButton(
                icon: const Icon(Icons.play_arrow, color: Colors.white,),
                onPressed: () {
                  if (videoPlayerController.value.isPlaying == true) {
                    videoPlayerController.pause();
                  }
                  else {
                    videoPlayerController.play();
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.keyboard_double_arrow_right_rounded, color: Colors.white,),
                onPressed: () {
                  videoPlayerController.seekTo(videoPlayerController.value.position + const Duration(seconds: 5));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}