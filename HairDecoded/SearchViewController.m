//
//  SearchViewController.m
//  HairDecoded
//
//  Created by George on 26/08/14.
//  Copyright (c) 2014 Wedomobile. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)xButton:(id)sender {
    self.searchField.text = @"";
}

- (IBAction)selection:(id)sender {
    UIButton *btn = (UIButton*)sender;
    
    int tag = (int)btn.tag;
    
    if (tag == 1){
        if ([[_i1 image] isEqual:[UIImage imageNamed:@"checkmark.png"]]){
            _i1.image = [UIImage imageNamed:@"unchecked.png"];
            _l1.textColor = [UIColor blackColor];
        }
        else {
            _i1.image = [UIImage imageNamed:@"checkmark.png"];
            _l1.textColor = commonColor;
        }
    }
    if (tag == 2){
        if ([[_i2 image] isEqual:[UIImage imageNamed:@"checkmark.png"]]){
            _i2.image = [UIImage imageNamed:@"unchecked.png"];
            _l2.textColor = [UIColor blackColor];
        }
        else {
            _i2.image = [UIImage imageNamed:@"checkmark.png"];
            _l2.textColor = commonColor;
        }
    }
    if (tag == 3){
        if ([[_i3 image] isEqual:[UIImage imageNamed:@"checkmark.png"]]){
            _i3.image = [UIImage imageNamed:@"unchecked.png"];
            _l3.textColor = [UIColor blackColor];
        }
        else {
            _i3.image = [UIImage imageNamed:@"checkmark.png"];
            _l3.textColor = commonColor;
        }
    }
    if (tag == 4){
        if ([[_i4 image] isEqual:[UIImage imageNamed:@"checkmark.png"]]){
            _i4.image = [UIImage imageNamed:@"unchecked.png"];
            _l4.textColor = [UIColor blackColor];
        }
        else {
            _i4.image = [UIImage imageNamed:@"checkmark.png"];
            _l4.textColor = commonColor;
        }
    }
    if (tag == 5){
        if ([[_i5 image] isEqual:[UIImage imageNamed:@"checkmark.png"]]){
            _i5.image = [UIImage imageNamed:@"unchecked.png"];
            _l5.textColor = [UIColor blackColor];
        }
        else {
            _i5.image = [UIImage imageNamed:@"checkmark.png"];
            _l5.textColor = commonColor;
        }
    }
    if (tag == 6){
        if ([[_i6 image] isEqual:[UIImage imageNamed:@"checkmark.png"]]){
            _i6.image = [UIImage imageNamed:@"unchecked.png"];
            _l6.textColor = [UIColor blackColor];
        }
        else {
            _i6.image = [UIImage imageNamed:@"checkmark.png"];
            _l6.textColor = commonColor;
        }
    }
    if (tag == 7){
        if ([[_i7 image] isEqual:[UIImage imageNamed:@"checkmark.png"]]){
            _i7.image = [UIImage imageNamed:@"unchecked.png"];
            _l7.textColor = [UIColor blackColor];
        }
        else {
            _i7.image = [UIImage imageNamed:@"checkmark.png"];
            _l7.textColor = commonColor;
        }
    }
    if (tag == 8){
        if ([[_i8 image] isEqual:[UIImage imageNamed:@"checkmark.png"]]){
            _i8.image = [UIImage imageNamed:@"unchecked.png"];
            _l8.textColor = [UIColor blackColor];
        }
        else {
            _i8.image = [UIImage imageNamed:@"checkmark.png"];
            _l8.textColor = commonColor;
        }
    }
    if (tag == 9){
        if ([[_i9 image] isEqual:[UIImage imageNamed:@"checkmark.png"]]){
            _i9.image = [UIImage imageNamed:@"unchecked.png"];
            _l9.textColor = [UIColor blackColor];
        }
        else {
            _i9.image = [UIImage imageNamed:@"checkmark.png"];
            _l9.textColor = commonColor;
        }
    }
    if (tag == 10){
        if ([[_i10 image] isEqual:[UIImage imageNamed:@"checkmark.png"]]){
            _i10.image = [UIImage imageNamed:@"unchecked.png"];
            _l10.textColor = [UIColor blackColor];
        }
        else {
            _i10.image = [UIImage imageNamed:@"checkmark.png"];
            _l10.textColor = commonColor;
        }
    }
    if (tag == 11){
        if ([[_i11 image] isEqual:[UIImage imageNamed:@"checkmark.png"]]){
            _i11.image = [UIImage imageNamed:@"unchecked.png"];
            _l11.textColor = [UIColor blackColor];
        }
        else {
            _i11.image = [UIImage imageNamed:@"checkmark.png"];
            _l11.textColor = commonColor;
        }
    }
    if (tag == 12){
        if ([[_i12 image] isEqual:[UIImage imageNamed:@"checkmark.png"]]){
            _i12.image = [UIImage imageNamed:@"unchecked.png"];
            _l12.textColor = [UIColor blackColor];
        }
        else {
            _i12.image = [UIImage imageNamed:@"checkmark.png"];
            _l12.textColor = commonColor;
        }
    }
    
    
    
}

- (IBAction)search:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
