//
//  NibblyController.m
//  Nibbly
//
//  Created by noutram on 05/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "NibblyController.h"


@implementation NibblyController
@synthesize view, button, label, otherViewController;

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
    }
    return self;
}


- (void) dealloc
{
    //Dealloc here
    self.label = nil;
    self.button = nil;
    self.view = nil;
    self.otherViewController = nil;
    [super dealloc];
}


-(IBAction)doSomething:(id)sender
{
    NSLog(@"Click!");
    if (self.otherViewController == nil) {
        otherViewController = [[SimpleController alloc] initWithNibName:@"SimpleController"];
        CGRect r = self.otherViewController.view.frame;
        r.origin.x = 50; r.origin.y = 50;
        self.otherViewController.view.frame = r;
        [self.view addSubview:self.otherViewController.view];        
    } else {
        [self.otherViewController.view removeFromSuperview];
        self.otherViewController = nil;
    }
}


@end
