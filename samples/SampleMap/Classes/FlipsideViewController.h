//
//  FlipsideViewController.h
//  SampleMap : Diagnostic map
//

#import <UIKit/UIKit.h>
#import "RMMapView.h"

@interface FlipsideViewController : UIViewController {
	IBOutlet UITextField *centerLatitude;
	IBOutlet UITextField *centerLongitude;
	IBOutlet UITextField *zoomLevel;
	IBOutlet UITextField *minZoom;
	IBOutlet UITextField *maxZoom;
}

@property(nonatomic,retain) IBOutlet UITextField *centerLatitude;
@property(nonatomic,retain) IBOutlet UITextField *centerLongitude;
@property(nonatomic,retain) IBOutlet UITextField *zoomLevel;
@property(nonatomic,retain) IBOutlet UITextField *minZoom;
@property(nonatomic,retain) IBOutlet UITextField *maxZoom;

- (RMMapContents *)contents;

- (IBAction)clearSharedNSURLCache;
- (IBAction)clearMapContentsCachedImages;
@end
