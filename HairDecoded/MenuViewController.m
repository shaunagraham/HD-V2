//
//  LeftMenuViewController.m
//  BarMates
//
//  Created by George Burduhos on 9/26/13.
//
//

#import "MenuViewController.h"
#import "AppDelegate.h"
#import "Custom.h"
#import "HomeViewController.h"
#import "MenuCell.h"
#import "SettingsViewController.h"


@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)close:(id)sender {
    [self.viewDeckController closeLeftView];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;

    
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil]
     setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]
     forState:UIControlStateNormal];
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MenuCell";
    MenuCell *cell = (MenuCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        cell = [[MenuCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
        // Do something here......................
    }
    
    //TODO: either support tabbaritem or a protocol in order to handle images in the menu.
    
    cell.backgroundColor = UIColor.clearColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    if (indexPath.row == 0){
        cell.buttonImage.image = [UIImage imageNamed:@"home _thumb_full.png"];
    }
    if (indexPath.row == 1){
        cell.buttonImage.image = [UIImage imageNamed:@"profile _thumb_clear.png"];
    }
    if (indexPath.row == 2){
        cell.buttonImage.image = [UIImage imageNamed:@"camera_thumb_clear.png"];
    }
    if (indexPath.row == 3){
        cell.buttonImage.image = [UIImage imageNamed:@"messages_thumb_clear.png"];
    }
    if (indexPath.row == 4){
        cell.buttonImage.image = [UIImage imageNamed:@"comment _thumb_clear.png"];
    }
    if (indexPath.row == 5){
        cell.buttonImage.image = [UIImage imageNamed:@"appoinments _thumb_clear.png"];
    }
    if (indexPath.row == 6){
        cell.buttonImage.image = [UIImage imageNamed:@"find _thumb_clear.png"];
    }
    if (indexPath.row == 7){
        cell.buttonImage.image = [UIImage imageNamed:@"setting _thumb_clear.png"];
    }

    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (IS_IPHONE_5)return 60;
    return 55;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UIViewController *previousChildViewController =
    //[self transitionFromViewController:previousChildViewController toViewController:newController duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:NULL completion:NULL];

    if (indexPath.row == 0){
        HomeViewController *controller = [[HomeViewController alloc]init];
        self.viewDeckController.centerController = [[UINavigationController alloc]initWithRootViewController:controller];
        [self.viewDeckController closeRightView];
    }
    if (indexPath.row == 7){
        SettingsViewController *controller = [[SettingsViewController alloc]init];
        self.viewDeckController.centerController = [[UINavigationController alloc]initWithRootViewController:controller];
        [self.viewDeckController closeRightView];
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
