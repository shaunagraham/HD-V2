//
//  ForgotPassViewController.m
//  HairDecoded
//
//  Created by George on 25/08/14.
//  Copyright (c) 2014 Wedomobile. All rights reserved.
//

#import "ForgotPassViewController.h"

@interface ForgotPassViewController ()

@end

@implementation ForgotPassViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.email becomeFirstResponder];
    [[self email] setTintColor:grayColor];
    
    
    
    self.email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email address" attributes:@{NSForegroundColorAttributeName: grayColor}];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    [[UIToolbar appearance] setBarTintColor:commonColor];
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Email new password" style:UIBarButtonItemStylePlain target:self action:@selector(sendEmail)];
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolbar setItems:[NSArray arrayWithObjects:bar,cancel,bar, nil]];
    
    self.email.inputAccessoryView = toolbar;
    NSDictionary *barButtonAppearanceDict = @{NSFontAttributeName : [UIFont fontWithName:@"Avenir-Light" size:17.0] , NSForegroundColorAttributeName: [UIColor whiteColor]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:barButtonAppearanceDict forState:UIControlStateNormal];
    
}

-(void)sendEmail{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
