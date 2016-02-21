//
//  DataWrapper.m
//  Apportunity
//
//  Created by George Burduhos on 30/11/15.
//  Copyright © 2015 George Burduhos. All rights reserved.
//

#import "DataWrapper.h"
#import "Custom.h"
#define docs [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]


@implementation DataWrapper

+(void)saveUserData:(NSDictionary*)user{
    NSString *pathToDefaultPlist = [docs stringByAppendingPathComponent:@"user.plist"];
    NSURL *urlxx =[NSURL fileURLWithPath:pathToDefaultPlist];
    [dictionaryByReplacingNullsWithStrings(user) writeToURL:urlxx atomically:NO];
}

+(User*)currentUser{
    NSString *pathToDefaultPlist = [docs stringByAppendingPathComponent:@"user.plist"];
    NSURL *urlxx =[NSURL fileURLWithPath:pathToDefaultPlist];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithContentsOfURL:urlxx];
    
    User *value = [[User alloc]init];
    value.fbID = [dictionary valueForKey:@""];
    value.user_id = [dictionary objectForKey:@"user_id"];
    value.token = md5([NSString stringWithFormat:@"2LOovo3Ip%@2LOovo3Ip", value.user_id]);
//    value.about;
//    value.address;
//    value.city;
//    value.country;
    value.display_name = [dictionary valueForKey:@"display_name"];
    value.email = [dictionary valueForKey:@"email"];
    value.first_name = [dictionary valueForKey:@"first_name"];
//    value.gender;
    value.hash_value = [dictionary valueForKey:@"hash"];
//    value.is_active;
    value.last_name = [dictionary valueForKey:@"last_name"];
//    value.latitude;
//    value.longitude;
//    value.password;
//    value.phone;
//    value.pro_type;
//    value.profile_image;
//    value.profile_url;
//    value.sn;
//    value.sn_user_id;
//    value.state;
//    value.url_name;
//    value.user_created_on;
//   
//    value.user_type;
    
    
    return value;
}





+(void)initUserData{
    NSArray * directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString * userPlistAtPath = [NSString stringWithFormat:@"%@/user.plist",[directoryPath objectAtIndex:0 ]];
    
    if(![[NSMutableDictionary alloc]initWithContentsOfFile:userPlistAtPath])
    {
        [[[NSMutableDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user.plist" ofType:nil]]writeToFile:userPlistAtPath atomically:NO];
    }

}

+(void)deleteUserData{
    NSArray * directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * userPlistAtPath = [NSString stringWithFormat:@"%@/user.plist",[directoryPath objectAtIndex:0 ]];
    [[[NSMutableDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user.plist" ofType:nil]]writeToFile:userPlistAtPath atomically:NO];
    
}




@end
