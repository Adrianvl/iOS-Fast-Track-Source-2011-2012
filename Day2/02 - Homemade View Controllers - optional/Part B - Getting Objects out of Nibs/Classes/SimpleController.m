//
//  SimpleController.m
//  Nibbly
//
//  Created by noutram on 05/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "SimpleController.h"


@implementation SimpleController
@synthesize view, button, label;


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
        NSLog(@"Loaded %d objects of type:", [objects count]);
        for (NSUInteger n=0; n<[objects count]; n++) {
            NSLog(@"\tObject %d is of type %@", n, [[objects objectAtIndex:n] class]);
        }
    }
    return self;
}


- (void) dealloc
{
    //Dealloc here
    self.label = nil;
    self.button = nil;
    self.view = nil;
    [super dealloc];
}

@end
