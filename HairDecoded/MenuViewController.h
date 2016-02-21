//
//  LeftMenuViewController.h
//  BarMates
//
//  Created by George Burduhos on 9/26/13.
//
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"


@interface MenuViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate> {
}

@property (weak, nonatomic) IBOutlet UITableView *table;




@end
