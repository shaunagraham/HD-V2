//
//  SettingsViewController.h
//  HairDecoded
//
//  Created by George on 26/08/14.
//  Copyright (c) 2014 Wedomobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *table;

@property (strong, nonatomic) UISwitch *keepPrivate;
@property (strong, nonatomic) UISwitch *notifications;
@property (strong, nonatomic) UIButton *logOut;

@end
