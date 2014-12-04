//
//  ColorViewController.h
//  Klus_Project2
//
//  Created by Ivan Klus on 9/16/14.
//  Copyright (c) 2014 University of Cincinnati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorViewController : UIViewController
{
    UIColor* color;
    
    // Creates the path reference but it doesn't 
    UIBezierPath* path;
}

@property (weak, nonatomic) IBOutlet UIImageView *canvas;

@end
