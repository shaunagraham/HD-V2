//
//  DataWrapper.h
//  Apportunity
//
//  Created by George Burduhos on 30/11/15.
//  Copyright © 2015 George Burduhos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import <CommonCrypto/CommonDigest.h>



inline static NSString* md5(NSString* input)
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}

@interface DataWrapper : NSObject


+(void)saveUserData:(NSDictionary*)user;
+(User*)currentUser;



+(void)initUserData;




@end
