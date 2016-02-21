//
//  HomeViewController.m
//  HairDecoded
//
//  Created by George on 25/08/14.
//  Copyright (c) 2014 Wedomobile. All rights reserved.
//

#import "HomeViewController.h"
#import "Cell.h"
#import "CustomAnnotationView.h"
#import "Annotation.h"
#import "SearchViewController.h"
#import "UploadViewController.h"
#import "DataWrapper.h"
#import "APIWrapper.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)changeView:(id)sender {
    UIButton *btn = (UIButton*)sender;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    self.selectedLine.frame = CGRectMake(btn.tag*80, 108, 80, 2);
    [UIView commitAnimations];
    
    if (btn.tag == 0){
        self.collectionView.hidden = NO;
        self.map.hidden = YES;
    }
    if (btn.tag == 2){
        self.collectionView.hidden = YES;
        self.map.hidden = NO;
    }
    if (btn.tag == 3){
        UploadViewController *upload = [[UploadViewController alloc]init];
        [self.navigationController pushViewController:upload animated:YES];
    }
    
    
}

- (void)rightMenu:(id)sender {
    [self.viewDeckController openRightView];
}

-(void)searchScreen:(id)sender{
    SearchViewController *search = [[SearchViewController alloc]init];
    [self presentViewController:search animated:YES completion:nil];
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
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"MMMM d"];
    self.title = [format stringFromDate:[NSDate date]];
    
    UIButton *barright = [UIButton buttonWithType: UIButtonTypeCustom];
	barright.frame = CGRectMake(0, 0, 22, 15);
	[barright setBackgroundImage:[UIImage imageNamed:@"menu_button.png"] forState:UIControlStateNormal];
	[barright addTarget:self action:@selector(rightMenu:) forControlEvents:UIControlEventTouchUpInside];
	//self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:barright];

    UIButton *barleft = [UIButton buttonWithType: UIButtonTypeCustom];
	barleft.frame = CGRectMake(0, 0, 20, 20);
	[barleft setBackgroundImage:[UIImage imageNamed:@"search_button.png"] forState:UIControlStateNormal];
	[barleft addTarget:self action:@selector(searchScreen:) forControlEvents:UIControlEventTouchUpInside];
	//self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:barleft];
    [self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"Cell"];
    
    
    CLLocationCoordinate2D coord;
    coord.latitude = 40.7056308;
    coord.longitude = -73.9780035;
    Annotation *placemark=[[Annotation alloc] initWithCoordinate:coord andName:@"234567" andAddress:@"asdfghj"];
    [self.map addAnnotation:placemark];

    [self.map addAnnotation:placemark];

    
    [self.map setRegion:MKCoordinateRegionMake([[self.map.annotations objectAtIndex:0] coordinate], MKCoordinateSpanMake(1.5,1.5))];

    
    [APIWrapper getImagesWithHairType:@"wavy" limit:25 offset:0 callback:^(NSArray *response, NSString *error) {
        
    }];

}

#pragma map

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    static NSString *defaultPinID = @"Annottation";
	MKAnnotationView *retval = nil;
    if([annotation isKindOfClass: [MKUserLocation class]])
        return nil;
    
	if ([annotation isKindOfClass:[Annotation class]]) {
        
        retval =
        [self.map dequeueReusableAnnotationViewWithIdentifier:@"Annottation"];
        if (retval == nil)
        {
            retval = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID];
 

            [retval setImage:createThumb([UIImage imageNamed:@"1.png"])];

            
            retval.canShowCallout = NO;
            retval.userInteractionEnabled = YES;
            retval.enabled = YES;
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self action:@selector(detail:) forControlEvents:UIControlEventTouchUpInside];
            retval.rightCalloutAccessoryView = rightButton;
            
        }
        else {
            retval.annotation = annotation;
        }
        
    }
    else {
        
    }
    
    return retval;
}

-(void)detail:(id)sender{
    
}

-(void)mapView:(MKMapView *)mapView1 didSelectAnnotationView:(MKAnnotationView *)view{
    view.image = nil;
    
    if ([view isKindOfClass:[CustomAnnotationView class]]){
        CustomAnnotationView *x = (CustomAnnotationView*)view;
        Annotation *v = (Annotation*)view.annotation;
       // x.name.text = [NSString stringWithFormat:@"%@ %@",[v.content objectForKey:@"title"],[v.content objectForKey:@"name"]];
    }


}

-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view{
 
    view.image = createThumb([UIImage imageNamed:@"1.png"]);
}


#pragma defaultView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  //  return self.content.count;
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = (Cell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.photo.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",indexPath.row+1]];
    
    
    return cell;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(105,105);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    

    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
