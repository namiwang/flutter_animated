# flutter_animated

Animated images (gif/apng) support in flutter.

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

2. a demo:

```dart
// import
import 'flutter_animated/animated_gif.dart';

// fetch a gif
final UInt8List imgBytes = await http.readBytes('https://some.site/some.gif');

// generate a Widget for the gif
final Widget gifWidget = new AnimatedGif(imgBytes);
```

## TODO

- [ ] it WILL FREEZE
- [ ] BUG alpha composition
- [ ] use the platform
  - android: android.graphics.Movie
- [ ] show firstFrame while parsing
- [ ] method to set speed/FPS
- [ ] method to controll play/pause
- [ ] method to set forward/reverse
- [ ] support input more than UInt8List
  - asset path, url, etc.
- [ ] support more formats like apng
