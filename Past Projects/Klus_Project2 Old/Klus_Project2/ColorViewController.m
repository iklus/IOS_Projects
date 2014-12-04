//
//  ColorViewController.m
//  Klus_Project2
//
//  Created by Ivan Klus on 9/16/14.
//  Copyright (c) 2014 University of Cincinnati. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()

@end

@implementation ColorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Reterive the standard user defaults.
    NSUserDefaults* sharedObject= [NSUserDefaults standardUserDefaults];
    
    // Retreive the four float values representing the color.
    float redValue = [sharedObject floatForKey:@"redValueKey"];
    float blueValue = [sharedObject floatForKey:@"blueValueKey"];
    float greenValue = [sharedObject floatForKey:@"greenValueKey"];
    float alphaValue = [sharedObject floatForKey:@"alphaValueKey"];
    
    // Construct a color using those four values.
    UIColor* color=[UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:alphaValue];
    
    // Requirement: change the backgroundColor of the current view of the controller (self) to the new color.
    [[self view]setBackgroundColor:color];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
