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

// Add the iOS ObjectiveC code that uses the iOS battery APIs to retrieve the battery level.
// This code is exactly the same as you would write in a native iOS app.
// Add the following method in the AppDelegate class, just before @end:
- (int)getBatteryLevel {
    UIDevice* device = UIDevice.currentDevice;
    device.batteryMonitoringEnabled = YES;
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return -1;
    } else {
        return (int)(device.batteryLevel * 100);
    }
}

@end
