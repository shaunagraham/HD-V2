//
//  JSON.h
//  Zonga
//
//  Created by Andrei Dumitru on 5/8/14.
//  Copyright (c) 2014 Trilulilu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)

- (id)objectFromJSONString;

@end

#pragma mark -
#pragma mark - NSDictionary (JSON)

@interface NSDictionary (JSON)

- (NSString *)JSONString;

@end