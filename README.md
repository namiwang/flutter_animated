# flutter_animated

Animated images (GIF/APNG/WebP) support in flutter.

The plugin is under construction.

It lacks of basic features, and has got a number of serious issues.

## USAGE

1. require it in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_animated: any
```

2. use it

```dart
// import
import 'flutter_animated/animated_gif.dart';

// fetch a gif
final Uint8List imgBytes = await http.readBytes('https://some.site/some.gif');

// generate a Widget for the gif
final Widget gifWidget = new AnimatedGif.memory(imgBytes);
```

## NOTES

Currently the only format being supported is `gif` and the only constructor is `.memory`.

`AnimatedGif` inherits from `Image` and `StatefulWidget`. This may change in the future though. It will always be a `Widget`, but maybe not an `Image`.

The performance is way not ideal for now. The good news is, it shows the first frame while decoding.

## TODO

- [ ] POOR PERFORMANCE it takes seconds to decode large images
- [ ] BUG malfunctioning alpha composition
- [ ] `use the platform` for high performance
  - android
    - android.graphics.Movie
    - https://github.com/koral--/android-gif-drawable
  - ios
    - https://github.com/Flipboard/FLAnimatedImage
    - https://github.com/ibireme/YYImage
- [ ] method to set speed/FPS
- [ ] method to controll play/pause
- [ ] method to set forward/reverse
- [ ] support input more than UInt8List
  - asset path, url, etc.
- [ ] support more formats like APNG and WebP
- [ ] proper testing
- [ ] proper example
- [ ] proper annotation and doc generating
