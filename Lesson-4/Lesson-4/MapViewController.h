//
//  MapViewController.h
//  Lesson-4
//
//  Created by Зинде Иван on 1/27/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define kLocationServiceDidUpdateCurrentLocation @"LocationServiceDidUpdateCurrentLocation"

@interface MapViewController : UIViewController <MKMapViewDelegate>

@end
