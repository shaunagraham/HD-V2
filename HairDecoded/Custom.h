//
//  Custom.h
//  Limetree
//
//  Created by George Burduhos on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


//#import "WebServiceWrapper.h"
//#import "JSON.h"
//#import <CommonCrypto/CommonDigest.h>
////#import "UIImageView+Cached.h"
//#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
//#import "ServerApi.h"
#import "IIViewDeckController.h"


// color define
#define BLUECOLOR [UIColor colorWithRed:72/255.0 green:167/255.0 blue:207/255.0 alpha:1.0]
#define LIGHTBLUE [UIColor colorWithRed:125/255.0 green:207/255.0 blue:208/255.0 alpha:1.0]

//Constants
#define TERMS_URL @"http://topmixtapes.com/pages/terms"

inline static UIImage *imageWithImage(UIImage *image, CGSize newSize) {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

inline static UIImage *createThumb(UIImage *img)
{
    CGSize size = CGSizeMake(55, 55);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGPoint thumbPoint = CGPointMake(0,0);
    
    UIImage *imageA = imageWithImage([UIImage imageNamed:@"border.png"], CGSizeMake(55, 55));
    [imageA drawAtPoint:thumbPoint];
    UIImage* starred = imageWithImage(img, CGSizeMake(45, 45));
    CGPoint starredPoint = CGPointMake(5, 5);
    [starred drawAtPoint:starredPoint];
    UIImage *imageC = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageC;
}


inline static CGRect sameHeightDifferentY(int y,CGRect rect){
    return CGRectMake(rect.origin.x,rect.origin.y-y,rect.size.width,rect.size.height);
}

inline static CGRect sameYDifferentHeight(int height,CGRect rect){
    return CGRectMake(rect.origin.x,rect.origin.y,rect.size.width,rect.size.height-height);
}


inline static NSString *encodeString(NSString* candidate)
{
    
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                               NULL,
                                                               (CFStringRef)candidate,
                                                               NULL,
                                                               (CFStringRef)@"",
                                                               kCFStringEncodingUTF8 ));
}

inline static NSString *decodeString(NSString* candidate)
{
    return (NSString *)[candidate stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}






inline static UILabel* attributedTitle (NSString *text){
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:21];
    titleLabel.textColor = [UIColor colorWithRed:253/255.0 green:91/255.0 blue:83/255.0 alpha:1.0];
    titleLabel.text = text;
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:titleLabel.text];
    [attributedString addAttribute:NSKernAttributeName value:@3 range:NSMakeRange(0, [titleLabel.text length])];
    [titleLabel setAttributedText:attributedString];
    
    return titleLabel;
}
inline static NSString* ownID(){
    NSString *pathToDefaultPlist = [docs stringByAppendingPathComponent:@"user.plist"];
    NSURL *urlxx =[NSURL fileURLWithPath:pathToDefaultPlist];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithContentsOfURL:urlxx];
    
    return [[dictionary objectForKey:@"info"] objectForKey:@"id"];
}

inline static NSString* username(){
    NSString *pathToDefaultPlist = [docs stringByAppendingPathComponent:@"user.plist"];
    NSURL *urlxx =[NSURL fileURLWithPath:pathToDefaultPlist];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithContentsOfURL:urlxx];
    
    return [dictionary objectForKey:@"user_name"];
}


inline static NSString* token(){
    NSString *pathToDefaultPlist = [docs stringByAppendingPathComponent:@"user.plist"];
    NSURL *urlxx =[NSURL fileURLWithPath:pathToDefaultPlist];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithContentsOfURL:urlxx];
    
    return [dictionary objectForKey:@"token"];
}


inline static NSString* user_id(){
    NSString *pathToDefaultPlist = [docs stringByAppendingPathComponent:@"user.plist"];
    NSURL *urlxx =[NSURL fileURLWithPath:pathToDefaultPlist];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithContentsOfURL:urlxx];
    
    return [[dictionary objectForKey:@"info"] objectForKey:@"id"];
}



inline static NSString* fbID(){
    NSString *pathToDefaultPlist = [docs stringByAppendingPathComponent:@"user.plist"];
    NSURL *urlxx =[NSURL fileURLWithPath:pathToDefaultPlist];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithContentsOfURL:urlxx];
    return [[dictionary objectForKey:@"info"] objectForKey:@"fbid"];
}


inline static void ShowMessageBox(NSString* title, NSString* body, NSInteger tag, id dlg)
{
	UIAlertView *baseAlert = [[UIAlertView alloc]initWithTitle:title  message:body delegate:dlg cancelButtonTitle:nil  otherButtonTitles:@"OK",nil];
	[baseAlert setTag:tag];
	[baseAlert show];	
 //   SafeReleaseNSObject(baseAlert);
}

inline static void ShowMessageError()
{
    UIAlertView *baseAlert = [[UIAlertView alloc]initWithTitle:@"Sorry, you do not have an internet connection, the latest data might not be available"  message:@"" delegate:nil cancelButtonTitle:nil  otherButtonTitles:@"OK",nil];
	[baseAlert setTag:-1];
	[baseAlert show];
  //  SafeReleaseNSObject(baseAlert);

}

inline static BOOL validateEmail(NSString * candidate )
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 	
    return [emailTest evaluateWithObject:candidate];
}
inline static BOOL validateMatchesConfirmation(NSString * candidate, NSString * confirmation)
{
    return [candidate isEqualToString:confirmation];
}

inline static BOOL validateMinimumLength(NSString * candidate , int length)
{
    return ([candidate length] >= length) ? YES : NO;
}

inline static BOOL isPassLoggedIn()
{
    
    BOOL value;
    NSString *pathToDefaultPlist = [docs stringByAppendingPathComponent:@"database.plist"];
    NSURL *urlxx =[NSURL fileURLWithPath:pathToDefaultPlist];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithContentsOfURL:urlxx]; 
    
    if ([[dictionary objectForKey:@"passed"] isEqualToString:@"YES"]){
        value =  YES;
        
    }
    else {
        value =  NO;
    }

    return value;
    
}

inline static NSMutableDictionary* dictionaryByReplacingNullsWithStrings(NSDictionary *candidate) {
    
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary: candidate];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for (NSString *key in candidate) {
        const id object = [candidate objectForKey: key];
        if (object == nul) {
            [replaced setObject: blank forKey: key];
        }
        else if ([object isKindOfClass: [NSDictionary class]]) {
            [replaced setObject: dictionaryByReplacingNullsWithStrings(object) forKey: key];
        }
    }
    return [NSMutableDictionary dictionaryWithDictionary: replaced];
}


inline static NSString* dateFromJSONString(NSString *candidate){
    candidate = [candidate stringByReplacingOccurrencesOfString:@"/Date("
                                                           withString:@""];
    candidate = [candidate stringByReplacingOccurrencesOfString:@")/"
                                                           withString:@""];
    
    unsigned long long milliseconds = [candidate longLongValue];
    NSTimeInterval interval = milliseconds/1000;
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *dfMyTime = [[NSDateFormatter alloc] init];
    [dfMyTime setDateStyle:NSDateFormatterLongStyle];
    
    return [dfMyTime stringFromDate:date];

}

inline static NSString* removeWhiteSpace(NSString *candidate){
    return [candidate stringByReplacingOccurrencesOfString:@" " withString:@""];
}

inline static void ShowMessageInfo(NSString* title, NSInteger tag, id dlg)
{
	UIAlertView *baseAlert = [[UIAlertView alloc]initWithTitle:title  message:nil delegate:dlg cancelButtonTitle:nil  otherButtonTitles:nil,nil];
	[baseAlert setTag:tag];
	[baseAlert show];
//    SafeReleaseNSObject(baseAlert);
}
