//
//  Definitions.h
//  HairDecoded
//
//  Created by George on 25/08/14.
//  Copyright (c) 2014 Wedomobile. All rights reserved.
//



#define docs [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)



#define commonColor [UIColor colorWithRed:0/255.0 green:187/255.0 blue:199/255.0 alpha:1.0]
#define grayColor [UIColor colorWithRed:142/255.0 green:142/255.0 blue:142/255.0 alpha:1.0]



