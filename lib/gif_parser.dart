import 'dart:typed_data';
import 'dart:isolate';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:image/image.dart' as image;

Future<List<ImageProvider>> parseGif(Uint8List imgBytes) async {
  var mainIn = new ReceivePort();

  await Isolate.spawn(_parser, mainIn.sendPort);

  Stream inStream = mainIn.asBroadcastStream();
  SendPort mainOut = await inStream.first;

  mainOut.send(imgBytes);

  return (await inStream.first);
}

void _parser(SendPort parserOut) {
  var parserIn = new ReceivePort();
  parserOut.send(parserIn.sendPort);

  parserIn.listen((imgBytes){
    final List<ImageProvider> parsedImages = image.decodeGifAnimation(imgBytes).frames.map((image.Image frame){
      return new MemoryImage(image.encodeGif(frame));
    }).toList();

    parserOut.send(parsedImages);
  });
}
