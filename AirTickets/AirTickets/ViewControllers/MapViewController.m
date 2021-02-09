//
//  MapViewController.m
//  AirTickets
//
//  Created by Зинде Иван on 2/4/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "MapViewController.h"
#import "LocationService.h"
#import "APIManager.h"
#import "MapPrice.h"
#import "CoreDataHelper.h"

@interface MapViewController ()<MKMapViewDelegate>

@property (strong, nonatomic) MKMapView *mapView;
@property (nonatomic, strong) LocationService *locationService;
@property (nonatomic, strong) City *origin;
@property (nonatomic, strong) NSArray *prices;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"map_tab", "");
    
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    [self.view addSubview:_mapView];
    
    [[DataManager sharedInstance] loadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataLoadedSuccessfully) name:kDataManagerLoadDataDidComplete object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCurrentLocation:) name:kLocationServiceDidUpdateCurrentLocation object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)dataLoadedSuccessfully {
    _locationService = [[LocationService alloc] init];
}

- (void)updateCurrentLocation:(NSNotification *)notification {
    CLLocation *currentLocation = notification.object;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(currentLocation.coordinate, 1000000, 1000000);
    [_mapView setRegion: region animated: YES];
    
    if (currentLocation) {
        _origin = [[DataManager sharedInstance] cityForLocation:currentLocation];
        if (_origin) {
            [[APIManager sharedInstance] mapPricesFor:_origin withCompletion:^(NSArray *prices) {
                self.prices = prices;
            }];
        }
    }
}
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    id <MKAnnotation> annotation = [view annotation];
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        for (MapPrice *price in _prices ) {
            if (ceilf(price.destination.coordinate.latitude) == ceilf(annotation.coordinate.latitude)
                && ceilf(price.destination.coordinate.longitude) == ceilf(annotation.coordinate.longitude)) {
                NSLog(@"%@", price.destination.name);
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"actions_with_tickets", "") message:NSLocalizedString(@"actions_with_tickets_describe", "") preferredStyle:UIAlertControllerStyleActionSheet];
                UIAlertAction *favoriteAction;
                if ([[CoreDataHelper sharedInstance] isFavoriteMapPrice:price]) {
                    favoriteAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"remove_from_favorite", "") style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                        [[CoreDataHelper sharedInstance] removeFromFavoriteMapPrice:price];
                    }];
                } else {
                    favoriteAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"add_to_favorite", "") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        [[CoreDataHelper sharedInstance] addToFavoriteMapPrice:price];
                    }];
                }
                
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"close", "") style:UIAlertActionStyleCancel handler:nil];
                [alertController addAction:favoriteAction];
                [alertController addAction:cancelAction];
                [self presentViewController:alertController animated:YES completion:nil];
                
              break;
            }
        }
    }
}

- (void)setPrices:(NSArray *)prices {
    _prices = prices;
    [_mapView removeAnnotations: _mapView.annotations];
    
    for (MapPrice *price in prices) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            annotation.title = [NSString stringWithFormat:@"%@ (%@)", price.destination.name, price.destination.code];
            annotation.subtitle = [NSString stringWithFormat:@"%ld руб.", (long)price.value];
            annotation.coordinate = price.destination.coordinate;
            [self->_mapView addAnnotation: annotation];
        });
    }
}

@end
