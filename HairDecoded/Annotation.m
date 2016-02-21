//
//  Annotation.m
//  CustomAnnotation
//
//  Created by akshay on 8/14/12.
//  Copyright (c) 2012 , inc. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation
@synthesize name,address,content;
@synthesize coordinate = _coordinate;

- (NSString *)subtitle{
    
	return address;
}
- (NSString *)title{
	return name;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)c andName:(NSString*)nm andAddress:(NSString*)addr{
    [self changeCoordinate:c];
	address = addr;
	name = nm;
	
	NSLog(@"ttt %f,%f",c.latitude,c.longitude);
	return self;
}

- (void)changeCoordinate:(CLLocationCoordinate2D)coordinate1 {
	
    _coordinate = coordinate1;
}

@end
