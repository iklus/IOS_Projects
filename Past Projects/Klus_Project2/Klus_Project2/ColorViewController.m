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
@synthesize canvas;

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
    color=[UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:alphaValue];
    UIColor* colorNegative=[UIColor colorWithRed:1-redValue green:1-greenValue blue:1-blueValue alpha:1];
    
    // Allocate memory to the BezierPath object and creates the object
    path=[UIBezierPath bezierPath];
    
    // Requirement: change the backgroundColor of the current view of the controller (self) to the new color.
    [[self view]setBackgroundColor:colorNegative];
    
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


// Implement the the TouchBegin action method to respond to the TouchBegin user action
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // Select a touch out of the SET of touches
    UITouch* userTouch = [[touches allObjects]objectAtIndex:0];
    
    // Get the location of the touch
    CGPoint startingPoint=[userTouch locationInView:canvas];
    
    // Add this location to the drawing object (UIBezierPath)
    [path moveToPoint:startingPoint];

}
    
// Implement the the TouchBegin
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    // Select a touch out of the SET of touches
    UITouch* userTouch = [[touches allObjects]objectAtIndex:0];
    
    // Get the location of the touch
    CGPoint currentPoint=[userTouch locationInView:canvas];
    
    // add the location to the path and connect
    [path addLineToPoint:currentPoint];
    
   //Draw
    // Set up the canvas
    UIGraphicsBeginImageContext(canvas.frame.size);
    
    // Set the properties of the path and the color
    [path setLineWidth:2.0];
    [color setStroke];
    
    // paint the image
    [path stroke]; // or [path fill];
    
    // Get the imaage from th canvas;
    UIImage* userImage=UIGraphicsGetImageFromCurrentImageContext();
    
    // Set in the canvas to the image we got
    [canvas setImage:userImage];
    
    //End image context
    UIGraphicsEndImageContext();
    
    
    
}


@end
