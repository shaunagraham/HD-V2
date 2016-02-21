//
//  CustomAnnotationView.m
//  CustomAnnotation
//
//  Created by on 8/17/12.
//  Copyright (c) 2012 , inc. All rights reserved.
//

#import "CustomAnnotationView.h"

@implementation CustomAnnotationView

@synthesize calloutView;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];


    if(selected)
    {
        //Add your custom view to self...
        self.viewCallout = [[UIView alloc]initWithFrame:CGRectMake(-58, -10, 167, 61)];
        calloutView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"more.png"]];
        [calloutView setFrame:CGRectMake(0,0, 167, 61)];
        [self.viewCallout addSubview:calloutView];
        
//        self.img = [[UIImageView alloc]initWithFrame:CGRectMake(96, 5, 30, 44)];
//        self.img.contentMode = UIViewContentModeScaleAspectFit;
//        [self.viewCallout addSubview:self.img];
//        
        self.name = [[UILabel alloc]initWithFrame:CGRectMake(15, 50, 200,15)];
        self.name.font = [UIFont systemFontOfSize:12];
        self.name.backgroundColor = [UIColor clearColor];
        self.name.textAlignment = NSTextAlignmentCenter;
        [self.viewCallout addSubview:self.name];
//
//        self.category = [[UILabel alloc]initWithFrame:CGRectMake(15, 62, 200,15)];
//        self.category.font = [UIFont systemFontOfSize:11];
//        self.category.backgroundColor = [UIColor clearColor];
//        self.category.textAlignment = NSTextAlignmentCenter;
//        self.category.textColor = [UIColor colorWithRed:191/255.0 green:130/255.0 blue:50/255.0 alpha:1.0];
//        [self.viewCallout addSubview:self.category];
//        
//        self.address = [[UILabel alloc]initWithFrame:CGRectMake(15, 74, 200,15)];
//        self.address.font = [UIFont systemFontOfSize:11];
//        self.address.backgroundColor = [UIColor clearColor];
//        self.address.textAlignment = NSTextAlignmentCenter;
//        self.address.textColor = [UIColor lightGrayColor];
//        [self.viewCallout addSubview:self.address];
//        
//        self.phone = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.phone.frame = CGRectMake(60, 83,110, 25);
//        self.phone.titleLabel.font = [UIFont systemFontOfSize:12];
//        [self.phone setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [self.viewCallout addSubview:self.phone];
//        
//        self.category.userInteractionEnabled = YES;
        [self addSubview:self.viewCallout];
    }
    else
    {
        //Remove your custom view...
        [self.viewCallout removeFromSuperview];
    }
}



@end
