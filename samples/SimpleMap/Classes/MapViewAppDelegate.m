//
//  MapViewAppDelegate.m
//
// Copyright (c) 2008, Route-Me Contributors
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

#import "MapViewAppDelegate.h"
#import "MapViewViewController.h"
#import "RMMapView.h"

@implementation MapViewAppDelegate

@synthesize window;
@synthesize viewController;

-(id)init
{
	if (self = [super init]) {
		//Notifications for tile requests.  This code allows for a class to know when a tile is requested and retrieved
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(tileRequested:) name:@"RMTileRequested" object:nil ];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(tileRetrieved:) name:@"RMTileRetrieved" object:nil ]; 
	}
	NSLog(@"%@ init", self);
	return self;
}

-(void)tileRequested:(NSNotification *)notification
{
	NSLog(@"Tile request started.");
}

-(void)tileRetrieved:(NSNotification *)notification;
{
	NSLog(@"Tile request ended.");
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	// Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
