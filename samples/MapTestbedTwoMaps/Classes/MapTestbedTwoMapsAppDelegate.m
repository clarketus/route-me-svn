//
//  MapTestbedAppDelegate.m
//  MapTestbed : Diagnostic map
//

#import "MapTestbedTwoMapsAppDelegate.h"
#import "RootViewController.h"

#import "RMPath.h"

@implementation MapTestbedTwoMapsAppDelegate


@synthesize window;
@synthesize rootViewController;

- (void)performTest
{
  
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    [window addSubview:[rootViewController view]];
    [window makeKeyAndVisible];

	[self performSelector:@selector(performTest) withObject:nil afterDelay:1.0]; 
}


- (void)dealloc {
	[rootViewController release];
    [window release];
    [super dealloc];
}

@end
