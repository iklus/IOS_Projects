//
//  ViewController.m
//  Klus_Project2
//
//  Created by Ivan Klus on 9/9/14.
//  Copyright (c) 2014 University of Cincinnati. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

@synthesize redSlider, greenSlider, blueSlider, alphaSlider, colorDisplay;
@synthesize redLabel, blueLabel, greenLabel, alphaLabel;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeColor {
    // Retreive value of slider.
    float redValue = [redSlider value];
    float greenValue = [greenSlider value];
    float blueValue = [blueSlider value];
    float alphaValue = [alphaSlider value];

    //Constructs a new color object using the values above.
    UIColor* userCreatedColor=[UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:alphaValue];
    
    // Sets the backgroundColor attribute or property to the color we created above.
    [colorDisplay setBackgroundColor:userCreatedColor];
    
    // Make text out of each color value
    NSString* redString=[NSString stringWithFormat:@"%.0f",redValue*255];
    NSString* blueString=[NSString stringWithFormat:@"%.0f",blueValue*255];
    NSString* greenString=[NSString stringWithFormat:@"%.0f",greenValue*255];
    NSString* alphaString=[NSString stringWithFormat:@"%4.2f",alphaValue];
    
    // Pace the text for each color
    [redLabel setText:redString];
    [blueLabel setText:blueString];
    [greenLabel setText:greenString];
    [alphaLabel setText:alphaString];
    
    // Get a refference to the standard user defaults.
    NSUserDefaults* sharedObject= [NSUserDefaults standardUserDefaults];
    
    // Put the color values in the standard user defaluts.
    [sharedObject setFloat:redValue forKey:@"redValueKey"];
    [sharedObject setFloat:blueValue forKey:@"blueValueKey"];
    [sharedObject setFloat:greenValue forKey:@"greenValueKey"];
    [sharedObject setFloat:alphaValue forKey:@"alphaValueKey"];

}

@end
