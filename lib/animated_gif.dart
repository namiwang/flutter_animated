import 'dart:async';
import 'dart:typed_data';

import 'dart:ui' as ui show Image;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import './gif_parser.dart';

// NOTE kinda ripped from the original MemoryImage
class _MemoryAnimatedGif extends ImageProvider<_MemoryAnimatedGif> {
  /// Creates an object that decodes a [Uint8List] buffer as an image.
  ///
  /// The arguments must not be null.
  const _MemoryAnimatedGif(this.bytes, { this.scale: 1.0 })
      : assert(bytes != null),
        assert(scale != null);

  /// The bytes to decode into an image.
  final Uint8List bytes;

  /// The scale to place in the [ImageInfo] object of the image.
  final double scale;

  // NOTE ripped. don't know details
  @override
  Future<_MemoryAnimatedGif> obtainKey(ImageConfiguration configuration) {
    return new SynchronousFuture<_MemoryAnimatedGif>(this);
  }

  @override
  ImageStreamCompleter load(_MemoryAnimatedGif key) {
    return new OneFrameImageStreamCompleter(_loadAsync(key));
  }

  Future<ImageInfo> _loadAsync(_MemoryAnimatedGif key) async {
    assert(key == this);

    final ui.Image image = await decodeImageFromList(bytes);
    if (image == null)
      return null;

    return new ImageInfo(
      image: image,
      scale: key.scale,
    );
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType)
      return false;
    final _MemoryAnimatedGif typedOther = other;
    return bytes == typedOther.bytes
        && scale == typedOther.scale;
  }

  @override
  int get hashCode => hashValues(bytes.hashCode, scale);

  @override
  String toString() => '$runtimeType(${bytes.runtimeType}#${bytes.hashCode}, scale: $scale)';
}

class AnimatedGif extends StatefulWidget {
  AnimatedGif.memory(
    @required Uint8List bytes,
    { Key key }
  ) :
    assert(bytes != null),
    imageProvider = new _MemoryAnimatedGif(bytes),
    super(key: key);

  final ImageProvider imageProvider;

  @override
  _AnimatedGifState createState() => new _AnimatedGifState();
}

class _AnimatedGifState extends State<AnimatedGif> {
  // List<ImageProvider> _frames = [];
  // int _currentFrameIndex = 0;

  @override
  void initState() {
    super.initState();

    // // first frame
    // _frames = [ new MemoryImage(widget.bytes) ];

    // _extractFrames().then((List frames){
    //   setState((){
    //     _frames = frames;
    //   });

    //   new Timer.periodic(const Duration(seconds: 1), (Timer timer){_updateFrame();});
    // });
  }

  @override
  Image build(BuildContext context) {
    // return new Image(image: _frames[_currentFrameIndex]);
    return new Image(image: widget.imageProvider);
  }

  // Future<List<ImageProvider>> _extractFrames() async {
  //   return parseGif(widget.bytes);
  // }

  // void _updateFrame() {
  //   setState((){
  //     _currentFrameIndex += 1;
  //     if ( _currentFrameIndex >= _frames.length ) {
  //       _currentFrameIndex = 0;
  //     }
  //   });
  // }
}
