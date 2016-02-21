//
//  CustomAnnotationView.h
//  CustomAnnotation
//
//  Created by on 8/17/12.
//  Copyright (c) 2012 raw engineering, inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotationView : MKPinAnnotationView

@property (strong, nonatomic) UIImageView *calloutView;
@property (strong, nonatomic) UIView *viewCallout;
@property (strong, nonatomic) UILabel *name;
@property (strong, nonatomic) UIImageView *img;
@property (strong, nonatomic) UILabel *category;
@property (strong, nonatomic) UILabel *address;
@property (strong, nonatomic) UIButton *phone;
@property (strong, nonatomic) NSDictionary *member;
@property (strong, nonatomic) UIButton *pinButton;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated;

@end