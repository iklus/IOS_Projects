//
//  ViewController.h
//  Klus_Project3
//
//  Created by Ivan Klus on 9/23/14.
//  Copyright (c) 2014 University of Cincinnati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray* units;  // A collection of the unit names
}

@property (weak, nonatomic) IBOutlet UITextField *inputAmount;

@property (weak, nonatomic) IBOutlet UIButton *convertButton;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerFrom;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerTo;

@property (weak, nonatomic) IBOutlet UILabel *lblResult;


@end
