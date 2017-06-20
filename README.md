# flutter_animated

Animated images (GIF/APNG/WebP) support in flutter.

The plugin is under construction and lacks of basic features.

## USAGE

### require it

in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_animated: any
```

### basic usage

```dart
// import
import 'flutter_animated/animated_gif.dart';

// fetch a gif
final Uint8List imgBytes = await http.readBytes('https://some.site/some.gif');

// generate a Widget for the gif
final Widget gifWidget = new AnimatedGif.memory(imgBytes);
```

## NOTES

Currently the only format being supported is `gif`, the only constructor is `.memory`, and FPS is always being 1/s.

`AnimatedGif` inherits from `Image` and `StatefulWidget`. This *may change in the future* though.

The performance is way not ideal for now. The good news is, it shows the first frame while decoding.
