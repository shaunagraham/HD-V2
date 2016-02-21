//
//  MainLoginViewController.m
//  HairDecoded
//
//  Created by George on 25/08/14.
//  Copyright (c) 2014 Wedomobile. All rights reserved.
//

#import "MainLoginViewController.h"
#import "EmaiLLoginViewController.h"
#import "CreateAccountViewController.h"
#import "APIWrapper.h"


@interface MainLoginViewController ()

@end

@implementation MainLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)facebookLogin:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"login"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"splashRemove" object:nil];
    
}

- (IBAction)emailLogin:(id)sender {
    EmaiLLoginViewController *controller = [[EmaiLLoginViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)createAccount:(id)sender {
    CreateAccountViewController *controller = [[CreateAccountViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (!IS_IPHONE_5){
        self.bottomView.frame = sameHeightDifferentY(84, self.bottomView.frame);
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
