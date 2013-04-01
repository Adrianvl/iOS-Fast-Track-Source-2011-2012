//
//  Boxes.h
//  CustomView
//
//  Created by noutram on 05/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Boxes : UIView {
    float length;
    float height;
    float xpos;
    float ypos;
    CGPoint center;
    
}

@property(readwrite, nonatomic) float length;
@property(readwrite, nonatomic) float height;
@property(readwrite, nonatomic) float xpos;
@property(readwrite, nonatomic) float ypos;
@property(readonly, nonatomic) CGPoint center;      //Creating a

@end
