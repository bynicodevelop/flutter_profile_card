#import "FlutterProfileCardPlugin.h"
#if __has_include(<flutter_profile_card/flutter_profile_card-Swift.h>)
#import <flutter_profile_card/flutter_profile_card-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_profile_card-Swift.h"
#endif

@implementation FlutterProfileCardPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterProfileCardPlugin registerWithRegistrar:registrar];
}
@end
