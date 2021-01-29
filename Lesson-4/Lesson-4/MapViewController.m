//
//  MapViewController.m
//  Lesson-4
//
//  Created by Зинде Иван on 1/27/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "LocationService.h"


@interface MapViewController ()

@property (strong, nonatomic) MKMapView *mapView;
@property (nonatomic, strong) LocationService *locationService;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"My city";
    
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    _mapView.showsUserLocation = YES;
    [self.view addSubview:_mapView];
    [_mapView setDelegate:self];
    
    
    _locationService = [[LocationService alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCurrentLocation:) name:kLocationServiceDidUpdateCurrentLocation object:nil];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)updateCurrentLocation:(NSNotification *)notification {
    CLLocation *currentLocation = notification.object;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(currentLocation.coordinate, 1000000, 1000000);
    [_mapView setRegion: region animated: YES];
    
    if (currentLocation) {
        
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            
            if ([placemarks count] > 0) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self->_mapView removeAnnotations: self->_mapView.annotations];
                    for (MKPlacemark *placemark in placemarks) {
                        
                        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
                        annotation.title = [NSString stringWithFormat:@"%@", placemark.locality];
                        annotation.subtitle = [NSString stringWithFormat:@"%@", placemark.name];
                        annotation.coordinate = currentLocation.coordinate;
                        [self->_mapView addAnnotation: annotation];
                    };
                });
            }
        }];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *identifier = @"MarkerIdentifier";
    MKMarkerAnnotationView *annotationView = (MKMarkerAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView) {
        annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
        annotationView.calloutOffset = CGPointMake(-5.0, 5.0);
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    annotationView.annotation = annotation;
    return annotationView;
}

@end
