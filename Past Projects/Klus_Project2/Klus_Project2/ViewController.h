//
//  ViewController.h
//  Klus_Project2
//
//  Created by Ivan Klus on 9/9/14.
//  Copyright (c) 2014 University of Cincinnati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *redSlider;

@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@property (weak, nonatomic) IBOutlet UISlider *greenSlider;

@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;

@property (weak, nonatomic) IBOutlet UIView *colorDisplay;

@property (weak, nonatomic) IBOutlet UILabel *redLabel;

@property (weak, nonatomic) IBOutlet UILabel *blueLabel;

@property (weak, nonatomic) IBOutlet UILabel *greenLabel;

@property (weak, nonatomic) IBOutlet UILabel *alphaLabel;

@end
