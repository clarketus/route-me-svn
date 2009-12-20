//
//  RMFileTileImage.m
//
// Copyright (c) 2008-2009, Route-Me Contributors
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

#import "RMFileTileImage.h"


@implementation RMFileTileImage

-(id)initWithTile: (RMTile) _tile FromFile: (NSString*) file
{
	if (![super initWithTile:_tile]) {
		return nil;
	}
	
	filePath = [file retain];
	
	// adding in this timer speeds up the maps as the map view is not waiting for the tiles to render before appearing
	[NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(startLoading:) userInfo:nil repeats:NO];
		
	return self;
}

- (void)startLoading:(NSTimer *)timer {
	[self performSelectorInBackground:@selector(loadImage) withObject:nil];
}

- (void)loadImage {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
		UIImage *image = [UIImage imageWithContentsOfFile:filePath];
		[self performSelectorOnMainThread:@selector(updateImageUsingImage:) withObject:image waitUntilDone:true];

	[pool release];
	
}

- (void)dealloc {
	[filePath release];
	[super dealloc];
}

@end
