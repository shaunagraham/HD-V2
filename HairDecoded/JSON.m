//
//  JSON.m
//  Zonga
//
//  Created by Andrei Dumitru on 5/8/14.
//  Copyright (c) 2014 Trilulilu. All rights reserved.
//

#import "JSON.h"

@implementation NSString (JSON)

- (id)objectFromJSONString {
    NSError *error = nil;
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
}

@end

#pragma mark -
#pragma mark - NSDictionary (JSON)

@implementation NSDictionary (JSON)

- (NSString *)JSONString {
    NSError *error = nil;
    NSString *string = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    if (!error) {
        string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return string;
}

@end
