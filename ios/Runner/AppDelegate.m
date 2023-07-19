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
    
    // The implementation of this platform method calls the iOS code written in the getBatteryLevel Method,
    // and returns a response for both the success and error cases using the result argument.
    // If an unknown method is called, report that instead.
    __weak typeof(self) weakSelf = self;
    [batteryChannel setMethodCallHandler: ^(FlutterMethodCall* call, FlutterResult result) {
        // This method is invoked on the UI thread.
        if ([@"getBatteryLevel" isEqualToString:call.method]) {
            int batteryLevel = [weakSelf getBatteryLevel];
            
            // You should now be able to run the app on iOS. If using the iOS Simulator,
            // note that it doesn’t support battery APIs, and the app displays ‘Battery level not available’.
            if (batteryLevel == -1) {
                result([FlutterError errorWithCode:@"UNAVAILABLE"
                                           message:@"Battery level not available."
                                           details:nil]);
            } else {
                result(@(batteryLevel));
            }
        } else {
            result(FlutterMethodNotImplemented);
        }
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
