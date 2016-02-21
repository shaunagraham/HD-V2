//
//  SettingsViewController.m
//  HairDecoded
//
//  Created by George on 26/08/14.
//  Copyright (c) 2014 Wedomobile. All rights reserved.
//

#import "SettingsViewController.h"
#import "ReportProblemViewController.h"
#import "PrivacyPolicyViewController.h"
#import "DeleteAccountViewController.h"
#import "AboutViewController.h"
#import "FAQViewController.h"
#import "ContactViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)rightMenu:(id)sender {
    [self.viewDeckController openRightView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIFont fontWithName:@"Avenir-Light" size:18], NSFontAttributeName,nil];
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    
    self.title = @"Settings";
    
    UIButton *barright = [UIButton buttonWithType: UIButtonTypeCustom];
	barright.frame = CGRectMake(0, 0, 22, 15);
	[barright setBackgroundImage:[UIImage imageNamed:@"menu_button.png"] forState:UIControlStateNormal];
	[barright addTarget:self action:@selector(rightMenu:) forControlEvents:UIControlEventTouchUpInside];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:barright];


    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont fontWithName:@"Avenir-Light" size:17.0];
    cell.textLabel.textColor = [UIColor blackColor];
    
    if (indexPath.row == 0)cell.textLabel.text = @"Find Friends";
    if (indexPath.row == 1)cell.textLabel.text = @"About";
    if (indexPath.row == 2)cell.textLabel.text = @"F.A.Q.";
    if (indexPath.row == 3){
        cell.textLabel.text = @"Notifications";
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        if (self.notifications == nil){
            self.notifications = [[UISwitch alloc]initWithFrame:CGRectMake(258, 7, 51, 31)];
            [self.notifications addTarget:self action:@selector(notifications:) forControlEvents:UIControlEventValueChanged];
            [cell.contentView addSubview:self.notifications];
            self.notifications.transform = CGAffineTransformMakeScale(0.75, 0.75);
            self.notifications.onTintColor = commonColor;

        }
        
        [self.notifications setOn:[[[NSUserDefaults standardUserDefaults] objectForKey:@"savePhotos"] boolValue]];
    }
    if (indexPath.row == 4){
        cell.textLabel.text = @"Private";
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        if (self.keepPrivate == nil){
            self.keepPrivate = [[UISwitch alloc]initWithFrame:CGRectMake(258, 10, 51, 31)];
            [self.keepPrivate addTarget:self action:@selector(keepPrivate:) forControlEvents:UIControlEventValueChanged];
            [cell.contentView addSubview:self.keepPrivate];
            self.keepPrivate.transform = CGAffineTransformMakeScale(0.75, 0.75);
            self.keepPrivate.onTintColor = commonColor;
        }
        
        [self.keepPrivate setOn:[[[NSUserDefaults standardUserDefaults] objectForKey:@"keepPrivate"] boolValue]];
    }
    if (indexPath.row == 5)cell.textLabel.text = @"Contact";
    if (indexPath.row == 6)cell.textLabel.text = @"Privacy Policy";
    if (indexPath.row == 7)cell.textLabel.text = @"Report A Problem";
    if (indexPath.row == 8)cell.textLabel.text = @"Delete Account";
    if (indexPath.row == 9){
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        if (self.logOut == nil){
            self.logOut = [UIButton buttonWithType:UIButtonTypeCustom];
            self.logOut.frame = CGRectMake(35, 8, 250, 28);
            self.logOut.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
            [self.logOut setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.logOut.titleLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:15.0]];
            [self.logOut setTitle:@"Log Out" forState:UIControlStateNormal];
         //   [self.logOut addTarget:self action:@selector(keepPrivate:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:self.logOut];
            UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 42, 320, 5)];
            v.backgroundColor = [UIColor whiteColor];
            [cell addSubview:v];
        }

        
    }
    
    
    
    
    return cell;
}

-(void)notifications:(id)sender{
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%@",self.notifications.isOn ? @"YES":@"NO"] forKey:@"notifications"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
-(void)keepPrivate:(id)sender{
    [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%@",self.keepPrivate.isOn ? @"YES":@"NO"] forKey:@"keepPrivate"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 1){
        AboutViewController *add = [[AboutViewController alloc]init];
        [self.navigationController pushViewController:add animated:YES];
    }
    
    if (indexPath.row == 2){
        FAQViewController *add = [[FAQViewController alloc]init];
        [self.navigationController pushViewController:add animated:YES];
    }
    
    


    if (indexPath.row == 5){
        ContactViewController *policy = [[ContactViewController alloc]init];
        [self.navigationController pushViewController:policy animated:YES];
    }
    if (indexPath.row == 6){
        PrivacyPolicyViewController *policy = [[PrivacyPolicyViewController alloc]init];
        [self.navigationController pushViewController:policy animated:YES];
    }
    if (indexPath.row == 7){
        ReportProblemViewController *report = [[ReportProblemViewController alloc]init];
        [self.navigationController pushViewController:report animated:YES];
    }

    if (indexPath.row == 8){
        DeleteAccountViewController *deleteAccount = [[DeleteAccountViewController alloc]init];
        [self.navigationController pushViewController:deleteAccount animated:YES];
    }
    if (indexPath.row == 9){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Are you sure?" message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Cancel",@"Yes", nil];
        alert.tag = 1;
        [alert show];
    }
    
    
    
    return indexPath;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
