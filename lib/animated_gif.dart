import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import './gif_parser.dart';

class AnimatedGif extends StatefulWidget {
  final Uint8List imgBytes;

  const AnimatedGif.memory(this.imgBytes, { Key key }) : super(key: key);

  @override
  _AnimatedGifState createState() => new _AnimatedGifState();
}

class _AnimatedGifState extends State<AnimatedGif> {
  List<Image> _frames = [];
  int currentFrameIndex = 0;

  @override
  void initState() {
    super.initState();

    // first frame
    _frames = [ new Image.memory( widget.imgBytes ) ];

    _extractFrames().then((List frames){
      setState((){
        _frames = frames;
      });

      new Timer.periodic(const Duration(seconds: 1), (Timer timer){_updateFrame();});
    });
  }

  @override
  Image build(BuildContext context) {
    return _frames[currentFrameIndex];
  }

  Future<List<Image>> _extractFrames() async {
    return parseGif(widget.imgBytes);
  }

  void _updateFrame() {
    setState((){
      currentFrameIndex += 1;
      if ( currentFrameIndex >= _frames.length ) {
        currentFrameIndex = 0;
      }
    });
  }
}
