#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import <Flutter/Flutter.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Make sure to use the same channel name as was used on the Flutter client side.
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    
    FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
                                            methodChannelWithName: @"fadyfawzy.com/battery"
                                            binaryMessenger:controller.binaryMessenger];
    
    [batteryChannel setMethodCallHandler: ^(FlutterMethodCall* call, FlutterResult result) {
        // This method is invoked on the UI thread.
    }];

  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
