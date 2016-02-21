//
//  HomeViewController.h
//  HairDecoded
//
//  Created by George on 25/08/14.
//  Copyright (c) 2014 Wedomobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface HomeViewController : UIViewController <MKMapViewDelegate>



@property (weak, nonatomic) IBOutlet UIView *selectedLine;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, retain) NSMutableArray *content;
@property (weak, nonatomic) IBOutlet MKMapView *map;



@end
