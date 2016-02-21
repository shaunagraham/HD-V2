//
//  EmaiLLoginViewController.m
//  HairDecoded
//
//  Created by George on 25/08/14.
//  Copyright (c) 2014 Wedomobile. All rights reserved.
//

#import "EmaiLLoginViewController.h"
#import "ForgotPassViewController.h"
#import "APIWrapper.h"
#import "DataWrapper.h"

@interface EmaiLLoginViewController ()

@end

@implementation EmaiLLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)forgotPassword:(id)sender {
    ForgotPassViewController *controller = [[ForgotPassViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.email becomeFirstResponder];
    [[self email] setTintColor:grayColor];
    [[self password] setTintColor:grayColor];
    

    
    self.email.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: grayColor}];
    self.password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: grayColor}];

    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    [[UIToolbar appearance] setBarTintColor:commonColor];
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Enter" style:UIBarButtonItemStylePlain target:self action:@selector(sendLogin)];
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolbar setItems:[NSArray arrayWithObjects:bar,cancel,bar, nil]];
    
    self.password.inputAccessoryView = toolbar;
    self.email.inputAccessoryView = toolbar;
    NSDictionary *barButtonAppearanceDict = @{NSFontAttributeName : [UIFont fontWithName:@"Avenir-Light" size:17.0] , NSForegroundColorAttributeName: [UIColor whiteColor]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:barButtonAppearanceDict forState:UIControlStateNormal];
    
}

-(void)sendLogin{
    [APIWrapper loginWithEmail:_email.text password:_password.text callback:^(NSDictionary *response, NSString *error) {
        NSLog(@"%@", response);
        if(error == nil){
            [DataWrapper saveUserData:response];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"splashRemove" object:nil];

        }
        else ShowMessageBox(@"", error, -1, nil);
        
        
        NSLog(@"%@", [DataWrapper currentUser].token);
        
        
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
