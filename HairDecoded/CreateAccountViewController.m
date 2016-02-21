//
//  CreateAccountViewController.m
//  HairDecoded
//
//  Created by George on 25/08/14.
//  Copyright (c) 2014 Wedomobile. All rights reserved.
//

#import "CreateAccountViewController.h"
#import "Custom.h"
#import "APIWrapper.h"
#import "DataWrapper.h"

@interface CreateAccountViewController ()

@end

@implementation CreateAccountViewController

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
    
    
    [self.lname becomeFirstResponder];
    [[self lname] setTintColor:grayColor];
    [self.fname becomeFirstResponder];
    [[self fname] setTintColor:grayColor];

    [[self password] setTintColor:grayColor];
    [[self email] setTintColor:grayColor];
    
    
    self.fname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"First Name" attributes:@{NSForegroundColorAttributeName: grayColor}];
    self.lname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Last Name" attributes:@{NSForegroundColorAttributeName: grayColor}];
    self.password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: grayColor}];
    self.email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: grayColor}];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    [[UIToolbar appearance] setBarTintColor:commonColor];
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Enter" style:UIBarButtonItemStylePlain target:self action:@selector(sendRegister)];
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolbar setItems:[NSArray arrayWithObjects:bar,cancel,bar, nil]];
    
    self.password.inputAccessoryView = toolbar;
    self.fname.inputAccessoryView = toolbar;
    self.lname.inputAccessoryView = toolbar;
    self.email.inputAccessoryView = toolbar;
    NSDictionary *barButtonAppearanceDict = @{NSFontAttributeName : [UIFont fontWithName:@"Avenir-Light" size:17.0] , NSForegroundColorAttributeName: [UIColor whiteColor]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:barButtonAppearanceDict forState:UIControlStateNormal];
    
    
}


-(void)sendRegister{
    
    [APIWrapper registerWitEmail:_email.text password:_password.text fName:_fname.text lName:_lname.text callback:^(NSDictionary *response, NSString *error) {
        NSLog(@"error %@", error);
        NSLog(@"response %@", response);

    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
