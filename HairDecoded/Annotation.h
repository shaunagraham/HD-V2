//
//  Annotation.h
//  CustomAnnotation
//
//  Created by  on 8/14/12.
//  Copyright (c) 2012 , inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation> {
@private CLLocationCoordinate2D _coordinate;
	
	NSString *name;
	NSString *address;
    NSDictionary *content;
}
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSDictionary *content;
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
-(id)initWithCoordinate:(CLLocationCoordinate2D)c andName:(NSString*)nm andAddress:(NSString*)addr;
- (NSString *)subtitle;
- (NSString *)title;

- (void)changeCoordinate:(CLLocationCoordinate2D)coordinate;

@end
