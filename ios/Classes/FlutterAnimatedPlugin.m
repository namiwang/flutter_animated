#import "FlutterAnimatedPlugin.h"
#import <flutter_animated/flutter_animated-Swift.h>

@implementation FlutterAnimatedPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAnimatedPlugin registerWithRegistrar:registrar];
}
@end
