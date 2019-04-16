import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPreview extends StatefulWidget {
  final VideoPlayerController player;
  final Function share;
  final Function repeat;

  VideoPlayerPreview(
      {@required this.player, @required this.share, @required this.repeat});
  @override
  _VideoPlayerPreviewState createState() {
    return _VideoPlayerPreviewState();
  }
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class _VideoPlayerPreviewState extends State<VideoPlayerPreview> {
  @override
  void initState() {
    super.initState();
    widget.player.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[_thumbnailWidget()],
        ),
        Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: widget.player == null ? Container() : _controllButtons())
      ],
    );
  }

  Widget _thumbnailWidget() {
    var videoController = widget.player;
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: videoController == null
            ? null
            : SizedBox(
                child: (videoController == null)
                    ? Container()
                    : Container(
                        child: Center(
                          child: Container(child: VideoPlayer(videoController)),
                        ),
                      ),
              ),
      ),
    );
  }

  Widget _controllButtons() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.player.value.isPlaying) {
                      widget.player.pause();
                    } else {
                      widget.player.play();
                    }
                  });
                },
                child: Icon(
                  widget.player.value.isPlaying ? Icons.stop : Icons.play_arrow,
                  size: 45,
                  color: Colors.white,
                )),
            GestureDetector(
                onTap: () {
                  widget.repeat();
                },
                child: Icon(
                  Icons.replay,
                  size: 45,
                  color: Colors.white,
                )),
            GestureDetector(
                onTap: () {
                  widget.share();
                },
                child: Icon(
                  Icons.share,
                  size: 45,
                  color: Colors.white,
                )),
          ],
        ));
  }
}
