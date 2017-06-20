import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import './gif_parser.dart';

class AnimatedGif extends StatefulWidget {
  const AnimatedGif.memory(this.bytes, { Key key }) : super(key: key);

  final Uint8List bytes;

  @override
  _AnimatedGifState createState() => new _AnimatedGifState();
}

class _AnimatedGifState extends State<AnimatedGif> {
  List<ImageProvider> _frames = [];
  int _currentFrameIndex = 0;

  @override
  void initState() {
    super.initState();

    // first frame
    _frames = [ new MemoryImage(widget.bytes) ];

    _extractFrames().then((List frames){
      setState((){
        _frames = frames;
      });

      new Timer.periodic(const Duration(seconds: 1), (Timer timer){_updateFrame();});
    });
  }

  @override
  Image build(BuildContext context) {
    return new Image(image: _frames[_currentFrameIndex]);
  }

  Future<List<ImageProvider>> _extractFrames() async {
    return parseGif(widget.bytes);
  }

  void _updateFrame() {
    setState((){
      _currentFrameIndex += 1;
      if ( _currentFrameIndex >= _frames.length ) {
        _currentFrameIndex = 0;
      }
    });
  }
}
