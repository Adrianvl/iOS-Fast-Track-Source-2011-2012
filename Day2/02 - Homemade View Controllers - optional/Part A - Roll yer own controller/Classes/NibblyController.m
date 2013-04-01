//
//  NibblyController.m
//  Nibbly
//
//  Created by noutram on 05/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "NibblyController.h"


@implementation NibblyController
@synthesize view, button;

-(id) init
{
    NSString *nibName = NSStringFromClass([self class]);
    return [self initWithNibName:nibName];
}

//New Designated Initialiser
- (id) initWithNibName:(NSString*)nibName
{
    self = [super init];
    if (self != nil) {
        //Initialise here
        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
        NSLog(@"Loaded %d objects", [objects count]);
    }
    return self;
}


- (void) dealloc
{
    //Dealloc here
    [super dealloc];
}


-(IBAction)doSomething:(id)sender
{
    NSLog(@"Click!");
}

@end
