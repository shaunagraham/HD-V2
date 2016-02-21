
#import "APIWrapper.h"
#import "Custom.h"
#import "JSON.h"
#define  API_URL  @"http://hairdecoded.com/hd/api/"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "DataWrapper.h"

@implementation APIWrapper

+ (NSDictionary *)defaultParamsAddingParams:(NSDictionary *)params {
    NSMutableDictionary *bodyDictionary = [NSMutableDictionary dictionaryWithDictionary:params];
   // [bodyDictionary setValue:[self APIKey] forKey:@"api_key"];
    if ([DataWrapper currentUser].token)[bodyDictionary setValue:[DataWrapper currentUser].token forKey:@"token"];
    
    return [NSDictionary dictionaryWithDictionary:bodyDictionary];
}

+ (NSString *)urlForMethod:(NSString*)methodName {
     return [NSString stringWithFormat:@"%@%@",API_URL,methodName];
}


+ (AFHTTPRequestOperationManager *)loginWithEmail:(NSString *)email password:(NSString*)password callback:(void (^)(NSDictionary *response, NSString *error))callback{

    NSDictionary *params = @{ @"email" : @"snankls@gmail.com", @"password" : @"aa" };
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:[self urlForMethod:@"login"] parameters:[self defaultParamsAddingParams:params] success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSLog(@"%@", responseObject);
         if ([responseObject[@"success"] intValue] == 1)callback([[responseObject objectForKey:@"response"] objectForKey:@"user"], nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callback (nil, @"Check internet connection and try again please.");
        NSLog(@"Error: %@", [error localizedDescription]);
    }];
    return manager;
}

+(void)loginFacebook:(UIViewController *)controller callback:(void (^)(NSDictionary *response, NSString *error))callback{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    login.loginBehavior = FBSDKLoginBehaviorSystemAccount;
    [login
     logInWithReadPermissions: @[@"public_profile",@"email",@"user_about_me"]
     fromViewController:controller
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
             callback (nil, [error description]);
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
             callback ([NSDictionary dictionaryWithObjectsAndKeys:@"cancelled",@"status", nil], nil);
         } else {
             NSLog(@"%@", result);
             NSLog(@"Logged in");
             NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
             [parameters setValue:@"id,name,email" forKey:@"fields"];
             [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
              startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                  if (!error) {
                      NSLog(@"%@", result);
                      callback (result, nil);
                  }
                  else{
                      callback (nil, [error description]);
                  }
              }];
             
             
             
             
         }
     }];
}

+ (AFHTTPRequestOperationManager*)loginWithFacebook:(UIViewController *)controller callback:(void (^)(NSDictionary *response, NSString *error))callback{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];

    [APIWrapper loginFacebook:controller callback:^(NSDictionary *response, NSString *error) {
        NSDictionary *params = @{ @"facebookId" : [response objectForKey:@"id"], @"email" : @""};
        [manager POST:[self urlForMethod:@"loginWithFacebook"] parameters:[self defaultParamsAddingParams:params] success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@", responseObject);
            if ([responseObject[@"success"] intValue] == 1)callback([responseObject objectForKey:@"data"], nil);
            else callback (nil, responseObject[@"message"]);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", [error localizedDescription]);
            callback (nil, @"Check internet connection and try again please.");
            
        }];

    }];

    
    return manager;
    
}



+ (AFHTTPRequestOperationManager*)registerWitEmail:(NSString *)email password:(NSString*)password fName:(NSString*)fName lName:(NSString*)lName callback:(void (^)(NSDictionary *response, NSString *error))callback{
    
    
    NSDictionary *params = @{@"password" : password ,@"confirm_password" : password, @"email" : email, @"first_name" : fName, @"last_name" : lName};
    
    NSLog(@"params %@   %@", [self defaultParamsAddingParams:params], [self urlForMethod:@"register"]);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:[self urlForMethod:@"register"] parameters:[self defaultParamsAddingParams:params] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject %@", responseObject);
        if ([responseObject[@"success"] intValue] == 1)callback([responseObject objectForKey:@"data"], nil);
        else callback (nil, responseObject[@"message"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", [error localizedDescription]);
        callback (nil, @"Check internet connection and try again please.");
        
    }];
    return manager;

    
}

+ (AFHTTPRequestOperationManager*)getImagesWithHairType:(NSString *)hairType limit:(int)limit offset:(int)offset callback:(void (^)(NSArray *response, NSString *error))callback{
    
    NSDictionary *params = @{@"hairtype" : hairType ,@"limit" : @(limit), @"offset" : @(offset), @"imgsize" : @(200), @"token" : [DataWrapper currentUser].hash_value};
    
    NSLog(@"params %@   %@", [self defaultParamsAddingParams:params], [self urlForMethod:@"list_of_images"]);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:[self urlForMethod:@"list_of_images"] parameters:[self defaultParamsAddingParams:params] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject %@", responseObject);

        if ([responseObject[@"status"] intValue] == 1)callback([responseObject objectForKey:@"data"], nil);
        else callback (nil, responseObject[@"message"]);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callback (nil, @"Check internet connection and try again please.");
        
        NSLog(@"Error: %@", [error localizedDescription]);
    }];
    return manager;

    
    
    
}




@end
