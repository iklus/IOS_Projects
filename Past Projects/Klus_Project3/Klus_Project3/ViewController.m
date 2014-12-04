//
//  ViewController.m
//  Klus_Project3
//
//  Created by Ivan Klus on 9/23/14.
//  Copyright (c) 2014 University of Cincinnati. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize pickerFrom, pickerTo, inputAmount, convertButton, lblResult;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Get a reference to the app bundle (or folder).
    NSBundle* appBundle =[NSBundle mainBundle];
    // Get a reference to the path of the file I need to acess.
    NSString* filePath =[appBundle pathForResource:@"unitsList" ofType:@"plist"];
    // Load the contents of the file into memory.
    units = [NSArray arrayWithContentsOfFile:filePath];
}


- (IBAction)convertUnits {
    
    // Dismiss keyboard
    [inputAmount resignFirstResponder];
    // retrieve the amount from the text field
    NSString* amountAsString =[inputAmount text];    // convert to float
    float amount = [amountAsString floatValue];
    
    // retrieve th unit from the pickerFrom
    NSInteger indexFrom =[pickerFrom selectedRowInComponent:0];
    NSString* unitsFrom =[units objectAtIndex: indexFrom];
    NSString* unitsTo =[units objectAtIndex:[pickerTo selectedRowInComponent:0]];
    
    // apply the conversion factor
    float inMeters = 0; // Converts to meters
    if ([unitsFrom isEqualToString:@"Feet"]) {
        inMeters = amount * 0.3048;
    } else if ([unitsFrom isEqualToString:@"Miles"]) {
        inMeters = 1609.344 * amount;
    } else if ([unitsFrom isEqualToString:@"Kilometer"]) {
        inMeters = 1000 * amount;
    } else if ([unitsFrom isEqualToString:@"Inch"]) {
        inMeters = amount * 0.0254;
    } else if ([unitsFrom isEqualToString:@"Meter"]) {
        inMeters = amount;
    } else if ([unitsFrom isEqualToString:@"Centimeter"]) {
        inMeters = amount/100;
    } else if ([unitsFrom isEqualToString:@"Football Fields"]) {
        inMeters = 91.44 * amount;
    } else if ([unitsFrom isEqualToString:@"Yard"]) {
        inMeters = 0.914 * amount;
    }
    
    float result = 0;
    // Convers back to desired units
    if ([unitsTo isEqualToString:@"Feet"]) {
        result = inMeters/0.3048;
    } else if ([unitsTo isEqualToString:@"Miles"]) {
        result = inMeters/1609.344;
    } else if ([unitsTo isEqualToString:@"Kilometer"]) {
        result = inMeters/1000;
    } else if ([unitsTo isEqualToString:@"Inch"]) {
        result = inMeters/0.0254;
    } else if ([unitsTo isEqualToString:@"Meter"]) {
        result = inMeters;
    } else if ([unitsFrom isEqualToString:@"Centimeter"]) {
        result = inMeters * 100;
    } else if ([unitsFrom isEqualToString:@"Football Fields"]) {
        result = inMeters/91.44;
    } else if ([unitsFrom isEqualToString:@"Yard"]) {
        result = inMeters/0.914;
    }
    
    NSString* resultString =[NSString stringWithFormat:@"%f %@ \n is equal to \n %f %@.",amount,unitsFrom,result,unitsTo];
    
    lblResult.text = resultString;
    
    [inputAmount resignFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self convertUnits];
    [inputAmount resignFirstResponder];
    return true;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self convertUnits];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [units count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [units objectAtIndex:row];
}



@end
