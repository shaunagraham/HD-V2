//
//  ZOAPI.h
//  Zonga
//
//  Created by Alexandru Tudose on 5/16/12.
//  Copyright (c) 2012 Trilulilu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface APIWrapper : NSObject


+ (AFHTTPRequestOperationManager*)loginWithEmail:(NSString *)email password:(NSString*)password callback:(void (^)(NSDictionary *response, NSString *error))callback;

+ (AFHTTPRequestOperationManager*)registerWitEmail:(NSString *)email password:(NSString*)password fName:(NSString*)fName lName:(NSString*)lName callback:(void (^)(NSDictionary *response, NSString *error))callback;


+ (AFHTTPRequestOperationManager*)loginWithFacebook:(UIViewController *)controller callback:(void (^)(NSDictionary *response, NSString *error))callback;


+ (AFHTTPRequestOperationManager*)getImagesWithHairType:(NSString *)hairType limit:(int)limit offset:(int)offset callback:(void (^)(NSArray *response, NSString *error))callback;;



@end
